- dashboard: executive_dash
  title: Executive Dashboard
  layout: grid
  rows: 
    - elements: [store_total, online_total]
      height: 120
    - elements: [store_sales_by_year, online_sales_by_year]
      height: 350
    - elements: [store_regional_sales, online_regional_sales]
      height: 290
    - elements: [top_store_products, top_online_products]
      height: 400
    - elements: [order_rate]
      height: 400

  filters:
    - name: date
      title: "Sales period:"
      type: date_filter
      default_value: 2001/01/01 to 2016/12/31
    - name: customer_type
      title: "Customer type:"
      type: field_filter
      explore: store_sales_fact
      field: customer_dimension.customer_type
    - name: measure_type
      title: "Measure type:"
      type: field_filter
      explore: store_sales_fact
      field: store_sales_fact.measure_type
      default_value: Sales

  elements:
  - name: store_total
    title: Store Sales Total
    type: single_value
    model: vmart1
    explore: store_sales_fact
    measures: [store_sales_fact.measure_total]
    #value_format: '#,##0,," M"'
    value_format: '#,##0'
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      measure_type: store_sales_fact.measure_type
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
    sorts: [store_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    font_size: medium
    
  - name: online_total
    title: Online Sales Total
    type: single_value
    model: vmart1
    explore: online_sales_fact
    measures: [online_sales_fact.measure_total]
    value_format: '#,##0'
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen: 
      customer_type: customer_dimension.customer_type
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
    sorts: [online_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    font_size: medium
   

 
#   - name: online_sales_overtime
#     title: "Online Sales Performance Overtime"
#     type: looker_line
#     model: vmart1
#     explore: online_sales_fact
#     dimensions: [date_dimension_sales.calendar_year_quarter]
#     measures: [online_sales_fact.measure_total]
#     filters:
#       online_sales_fact.transaction_type: '"purchase"'
#     listen: 
#       customer_type: customer_dimension.customer_type
#       date: date_dimension_sales.date_date
#       measure_type: online_sales_fact.measure_type
#     sorts: [date_dimension_sales.calendar_year_quarter]
#     limit: 500
#     column_limit: ''
#     show_null_points: true
#     stacking: ''
#     show_value_labels: false
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     point_style: none
#     interpolation: linear
    
    
  - name: online_sales_by_year
    title: 'Year over Year Comparison in Online Sales'
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
    x_axis_label: 'Month number'
    x_axis_datetime_label:
    x_axis_label_rotation:
    y_axis_orientation:
    y_axis_combined:
    y_axis_labels:
    y_axis_min:
    y_axis_max:
    hide_points: true
    colors: ['#353b49','#776fdf','#49cec1','#e9b404','#dc7350','#ed6168']
    

#   - name: store_sales_overtime
#     title: Store Sales Performance Overtime
#     type: looker_line
#     model: vmart1
#     explore: store_sales_fact
#     dimensions: [date_dimension.calendar_year_quarter]
#     measures: [store_sales_fact.measure_total]
#     filters:
#       store_sales_fact.transaction_type: '"purchase"'
#     listen: 
#       customer_type: customer_dimension.customer_type
#       date: date_dimension.date_date
#       measure_type: store_sales_fact.measure_type
#     sorts: [date_dimension.calendar_year_quarter]
#     limit: 500
#     column_limit: ''
#     show_null_points: true
#     stacking: ''
#     show_value_labels: false
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     point_style: none
#     interpolation: linear
    
  - name: store_sales_by_year
    title: 'Year over Year Comparison in Store Sales'
    type: looker_line
    model: vmart1
    explore: store_sales_fact
    dimensions: [date_dimension.calendar_month_number_in_year]
    pivots: [date_dimension.calendar_year]
    measures: [store_sales_fact.measure_total]
    sorts: [date_dimension.calendar_month_number_in_year]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen: 
      date: date_dimension.date_date
      customer_type: customer_dimension.customer_type
      measure_type: store_sales_fact.measure_type
    limit: 500
    width:
    height:
    legend_align:
    x_axis_label: 'Month number'
    x_axis_datetime: false
    x_axis_datetime_label:
    x_axis_label_rotation:
    y_axis_orientation:
    y_axis_combined:
    y_axis_labels:
    y_axis_min:
    y_axis_max:
    colors: ['#353b49','#776fdf','#49cec1','#e9b404','#dc7350','#ed6168']    
    
  - name: store_regional_sales
    title: Store Sales by Store Region
    type: looker_bar
    model: vmart1
    explore: store_sales_fact
    dimensions: [store_dimension.store_region]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      measure_type: store_sales_fact.measure_type
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
    sorts: [store_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    show_view_names: true
    quantize_colors: false
    colors: ['#008000']
    map: usa
    map_projection: ''
    loading: false

  - name: online_regional_sales
    title: Online Sales by Call Center Region 
    type: looker_bar
    model: vmart1
    explore: online_sales_fact
    dimensions: [call_center_dimension.cc_region]
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen:
      customer_type: customer_dimension.customer_type
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
    sorts: [online_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    total: true
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ['#008000']
    loading: false

  - name: top_online_products
    title: Online Sales by Product
    type: looker_column
    model: vmart1
    explore: online_sales_fact
    dimensions: [product_dimension.department_description]
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen: 
      customer_type: customer_dimension.customer_type
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
    sorts: [online_sales_fact.measure_total desc]
    column_limit: ''
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
 
  - name: top_store_products
    title: Store Sales by Product
    type: looker_column
    model: vmart1
    explore: store_sales_fact
    dimensions: [product_dimension.store_department_description]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen:
      measure_type: store_sales_fact.measure_type
      customer_type: customer_dimension.customer_type
      date: date_dimension.date_date
    sorts: [store_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false

    
  - name: order_rate
    title: Perfect Order Rate by vendor
    type: looker_column
    model: vmart1
    explore: store_orders_fact
    dimensions: [vendor_dimension.vendor_name]
    measures: [store_orders_fact.perfect_order_rate, store_orders_fact.perfect_quantity_rate,
      store_orders_fact.perfect_expected_date_rate]
    listen: 
      date: store_orders_fact.date_delivered_date
    sorts: [store_orders_fact.perfect_order_rate desc]
    limit: 500
    column_limit: ''
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_max: ['1']
    y_axis_min: ['0']
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
    y_axis_combined: true

    

