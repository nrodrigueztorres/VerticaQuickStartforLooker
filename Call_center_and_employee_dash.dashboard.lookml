- dashboard: call_center_and_employee_dashboard
  title: Call Center and Employee Dashboard
  layout: grid
  rows: 
    - elements: [online_sales_by_call_center_region, store_sales_by_employee_region]
      height: 400
    - elements: [top_5_call_centers, top_5_employees]
      height: 400

    
  filters:
  - name: date
    title: "Sales period"
    type: date_filter
    default_value: 2003/01/01 to 2007/12/31
  - name: measure_type
    title: "Sales Measure"
    type: field_filter
    explore: store_sales_fact
    field: store_sales_fact.measure_type
    default_value: Sales  
  - name: call_center_class
    title: "Call Center Class"
    type: field_filter
    explore: online_sales_fact
    field: call_center_dimension.cc_class
    #default_value:   
  
    

  elements:
  - name: top_5_call_centers
    title: "Top 10 Call Centers in Online Sales"
    type: looker_pie
    model: vmart1
    explore: online_sales_fact
    dimensions: [call_center_dimension.cc_name]
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen: 
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
      call_center_class: call_center_dimension.cc_class
    sorts: [online_sales_fact.measure_total desc]
    limit: 10
    column_limit: ''
    show_view_names: true
    inner_radius: 40
    colors: ['#706080', '#353b49', '#635189', '#b3a0dd', '#776fdf', '#1ea8df', '#a2dcf3',
    '#49cec1', '#e9b404', '#dc7350', '#ed6168']

    
  - name: top_5_employees
    title: "Top 10 Employees in Store Sales"
    type: looker_pie
    model: vmart1
    explore: store_sales_fact
    dimensions: [employee_dimension.employee_full_name]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen: 
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
    sorts: [store_sales_fact.measure_total desc]
    limit: 10
    column_limit: ''
    show_view_names: true
    inner_radius: 40
    colors: ['#706080', '#353b49', '#635189', '#b3a0dd', '#776fdf', '#1ea8df', '#a2dcf3',
    '#49cec1', '#e9b404', '#dc7350', '#ed6168']


  - name: online_sales_by_call_center_region
    title: "Online Sales by Call Center Region"
    type: looker_column
    model: vmart1
    explore: online_sales_fact
    dimensions: [call_center_dimension.cc_region]
    measures: [online_sales_fact.measure_total]
    filters:
      online_sales_fact.transaction_type: '"purchase"'
    listen: 
      date: date_dimension_sales.date_date
      measure_type: online_sales_fact.measure_type
      call_center_class: call_center_dimension.cc_class
    sorts: [online_sales_fact.measure_total desc]
    limit: 500
    column_limit: ''
    show_view_names: true
    show_null_points: true
    stacking: ''
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false

  - name: store_sales_by_employee_region
    title: "Store Sales by Employee Region"
    type: looker_column
    model: vmart1
    explore: store_sales_fact
    dimensions: [employee_dimension.employee_region]
    measures: [store_sales_fact.measure_total]
    filters:
      store_sales_fact.transaction_type: '"purchase"'
    listen: 
      date: date_dimension.date_date
      measure_type: store_sales_fact.measure_type
    sorts: [store_sales_fact.measure_total desc]
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
      
