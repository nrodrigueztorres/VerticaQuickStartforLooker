- dashboard: online_sales_dashboard
  title: Online Sales Dashboard
  layout: tile
  tile_size: 100
    

  filters:
  - name: date
    title: "Sales period"
    type: date_filter
    default_value: 2003/01/01 to 2007/12/31
  - name: customer_type
    type: field_filter
    explore: online_sales_fact
    field: customer_dimension.customer_type
    #default_value:
  - name: measure_type
    type: field_filter
    explore: online_sales_fact
    field: online_sales_fact.measure_type
    default_value: Sales
  - name: product_type
    type: field_filter
    explore: online_sales_fact
    field: product_dimension.department_description
    
    
    
  elements:
  - name: online_sales_total 
    title: "Online Sales Total"
    type: single_value
    model: vmart1
    explore: online_sales_fact
    measures: [online_sales_fact.measure_total]
    listen: 
      customer_type: customer_dimension.customer_type
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
      product_type: product_dimension.department_description
    sorts: [online_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    font_size: medium
    
  - name: online_sales_overtime
    title: "Online Sales Performance Overtime"
    type: looker_line
    model: vmart1
    explore: online_sales_fact
    dimensions: [date_dimension_sales.calendar_year_quarter]
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen: 
      customer_type: customer_dimension.customer_type
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
    sorts: [date_dimension_sales.calendar_year_quarter]
    limit: 500
    column_limit: ''
    show_null_points: true
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    point_style: none
    interpolation: linear
   
   
    
    
  - name: online_sales_by_year2
    title: 'Online Sales Performance (YoY)'
    type: looker_line
    model: vmart1
    explore: online_sales_fact
    dimensions: [date_dimension_sales.calendar_month_number_in_year]
    pivots: [date_dimension_sales.calendar_year]
    measures: [online_sales_fact.measure_total]
    sorts: [date_dimension_sales.calendar_month_number_in_year]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen: 
      date: date_dimension_sales.date_date
      customer_type: customer_dimension.customer_type
      measure_type: online_sales_fact.measure_type
    limit: 500
    width: 
    height:
    legend_align:
    x_axis_label: 'Month Number'
    x_axis_datetime: true
    x_axis_datetime_label:
    x_axis_label_rotation:
    y_axis_orientation:
    y_axis_combined:
    y_axis_labels:
    y_axis_min:
    y_axis_max:
    hide_points: true
    colors: ['#353b49','#776fdf','#49cec1','#e9b404','#dc7350','#ed6168']    
    
  - name: regional_sales
    title: "Regional Online Sales"
    type: looker_geo_choropleth
    model: vmart1
    explore: online_sales_fact
    dimensions: [customer_dimension.customer_state]
    measures: [online_sales_fact.total_sales]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen:
      date: date_dimension_sales.date_date
      product_type: product_dimension.department_description
    sorts: [online_sales_fact.total_sales desc]
    limit: 500
    column_limit: ''
    total: true
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ['#008000']
    loading: false
  
  - name: top_10_customers
    title: "Top 10 customers in Online Sales"
    type: looker_bar
    model: vmart1
    explore: online_sales_fact
    dimensions: [customer_dimension.customer_name]
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen: 
      customer_type: customer_dimension.customer_type
      measure_type: online_sales_fact.measure_type
      product_type: product_dimension.department_description
    sorts: [online_sales_fact.measure_total desc]
    limit: 10
    column_limit: ''
    show_null_points: true
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false

  
  - name: top_10_products
    title: "Top 10 products in Online Sales"
    type: table
    model: vmart1
    explore: online_sales_fact
    dimensions: [product_dimension.department_description]
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen: 
      customer_type: customer_dimension.customer_type
      measure_type: online_sales_fact.measure_type
      product_type: product_dimension.department_description      
    sorts: [online_sales_fact.measure_total]
    limit: 10
    column_limit: ''

  - name: promo_comparison
    title: "Promotions Comparison in Online Sales"
    type: looker_pie
    model: vmart1
    explore: online_sales_fact
    dimensions: [promotion_dimension.ad_type]
    measures: [online_sales_fact.measure_total]
    listen: 
      customer_type: customer_dimension.customer_type
      measure_type: online_sales_fact.measure_type
      product_type: product_dimension.department_description    
    sorts: [online_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    show_view_names: true
    inner_radius: 50
    colors: ['#635189','#49cec1','#e9b404','#dc7350','#ed6168']
   

  - name: call_center_performance
    title: "Call Center Performance in Online Sales"
    type: looker_column
    model: vmart1
    explore: online_sales_fact
    dimensions: [call_center_dimension.cc_name]
    measures: [online_sales_fact.measure_total]
    listen: 
      customer_type: customer_dimension.customer_type
      measure_type: online_sales_fact.measure_type
      product_type: product_dimension.department_description   
    sorts: [online_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
    
    
    
