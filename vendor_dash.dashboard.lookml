- dashboard: vendor_dashboard
  title: Vendor Dashboard
  layout: grid
  rows: 
    - elements: [on_time_delivery_rate, quantity_accuracy_rate, perfect_order_rate]
      height: 180
    - elements: [year_over_year_comparison, Metric_by_Store_Location]
      height: 400
    - elements: [top_vendors_on_time_delivery_rate, top_vendors_quantity_accuracy_rate, top_vendors_perfect_order_rate]
      height: 230
    

  filters:
  - name: date
    title: "Order delivered date"
    type: date_filter
    default_value: 2003/01/01 to 2007/12/31
  - name: vendor_name
    title: "Vendor Name"
    type: field_filter
    explore: store_orders_fact
    field: vendor_dimension.vendor_name
  - name: measure_type
    title: "Measure"
    type: field_filter
    explore: store_orders_fact
    field: store_orders_fact.measure_type
    default_value: "Avg Quantity Delivered"
    
  
  elements:
  - name: on_time_delivery_rate
    title: On-time Delivery Rate
    type: single_value
    model: vmart1
    explore: store_orders_fact
    measures: [store_orders_fact.perfect_expected_date_rate]
    listen: 
      date: store_orders_fact.date_delivered_date
      #measure_type: online_sales_fact.measure_type
      vendor_name: vendor_dimension.vendor_name
    limit: 500
    column_limit: ''
    font_size: medium
    
  - name: top_vendors_on_time_delivery_rate
    title: Top 5 Vendors in On-time Delivery Rate
    type: table
    model: vmart1
    explore: store_orders_fact
    dimensions: [vendor_dimension.vendor_name]
    measures: [store_orders_fact.perfect_expected_date_rate]
    listen: 
      date: store_orders_fact.date_delivered_date
    sorts: [store_orders_fact.perfect_expected_date_rate desc]
    limit: 5
    column_limit: '' 
    
  - name: quantity_accuracy_rate
    title: Quantity Accuracy Rate
    type: single_value
    model: vmart1
    explore: store_orders_fact
    measures: [store_orders_fact.perfect_quantity_rate]
    listen: 
      date: store_orders_fact.date_delivered_date
      #measure_type: online_sales_fact.measure_type
      vendor_name: vendor_dimension.vendor_name
    limit: 500
    column_limit: ''
    font_size: medium
    
  - name: top_vendors_quantity_accuracy_rate
    title: Top 5 Vendors in Quantity Accuracy Rate
    type: table
    model: vmart1
    explore: store_orders_fact
    dimensions: [vendor_dimension.vendor_name]
    measures: [store_orders_fact.perfect_quantity_rate]
    listen: 
      date: store_orders_fact.date_delivered_date
    sorts: [store_orders_fact.perfect_quantity_rate desc]
    limit: 5
    column_limit: ''
    

  - name: perfect_order_rate
    title: Perfect Order Rate
    type: single_value
    model: vmart1
    explore: store_orders_fact
    measures: [store_orders_fact.perfect_order_rate]
    listen: 
      date: store_orders_fact.date_delivered_date
      #measure_type: online_sales_fact.measure_type
      vendor_name: vendor_dimension.vendor_name
    limit: 500
    column_limit: ''
    font_size: medium
    
    
  - name: top_vendors_perfect_order_rate
    title: Top 5 Vendors in Perfect Order Rate
    type: table
    model: vmart1
    explore: store_orders_fact
    dimensions: [vendor_dimension.vendor_name]
    measures: [store_orders_fact.perfect_order_rate]
    listen: 
      date: store_orders_fact.date_delivered_date
    sorts: [store_orders_fact.perfect_order_rate desc]
    limit: 5
    column_limit: ''

      
  - name: year_over_year_comparison
    title: Year over Year Comparison
    type: looker_line
    model: vmart1
    explore: store_orders_fact
    dimensions: [store_orders_fact.date_delivered_year, store_orders_fact.date_delivered_month_num]
    pivots: [store_orders_fact.date_delivered_year]
    measures: [store_orders_fact.order_measure]
    listen: 
      date: store_orders_fact.date_delivered_date
      measure_type: store_orders_fact.measure_type
      vendor_name: vendor_dimension.vendor_name
    sorts: [store_orders_fact.date_delivered_month_num]
    limit: 500
    column_limit: ''
    legend_align:
    x_axis_label: Month Number
    x_axis_datetime: true
    x_axis_datetime_label:
    x_axis_label_rotation:
    y_axis_orientation:
    y_axis_combined:
    y_axis_labels:
    y_axis_min:
    y_axis_max:
    hide_points: true
    colors: ['#776fdf','#49cec1','#e9b404','#dc7350','#ed6168']

   
   
  - name: Metric_by_Store_Location
    title: Metric by Store Location
    type: looker_geo_choropleth
    model: vmart1
    explore: store_orders_fact
    dimensions: [store_dimension.store_state]
    measures: [store_orders_fact.order_measure]
    listen: 
      date: store_orders_fact.date_delivered_date
      measure_type: store_orders_fact.measure_type
      vendor_name: vendor_dimension.vendor_name
    sorts: [store_orders_fact.order_measure desc]
    limit: 500
    column_limit: ''
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    colors: ['#008000']
    loading: false
     
   