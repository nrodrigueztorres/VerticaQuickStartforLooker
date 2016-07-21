- dashboard: inventory_dashboard
  title: Inventory Overview
  
  layout: grid
  rows: 
    - elements: [average_quantity_in_stock, min_quantity_in_stock, max_quantity_in_stock]
      height: 100
    - elements: [total_inventory_overtime, total_inventory_overtime_by_product]
      height: 280
    - elements: [breakdown_by_category, Breakdown_by_warehouse_name]
      height: 280

  filters:
  - name: date
    title: "Inventory timestamp:"
    type: date_filter
    default_value: 2003/01/01 to 2016/12/31

  elements:
  - name: average_quantity_in_stock
    title: Average Quantity in Stock
    type: single_value
    model: vmart1
    explore: inventory_fact
    measures: [inventory_fact.average_qty_in_stock]
    value_format: '#,##0.00'
    listen: 
      date: date_dimension.date_date
    limit: 500
    column_limit: ''
    font_size: small
   
  - name: min_quantity_in_stock
    title: Minimum Quantity in Stock
    type: single_value
    model: vmart1
    explore: inventory_fact
    measures: [inventory_fact.min_qty_in_stock]
    value_format: '#,##0.00'
    listen: 
      date: date_dimension.date_date
    limit: 500
    column_limit: ''
    font_size: small

  - name: max_quantity_in_stock
    title: Maximum Quantity in Stock
    type: single_value
    model: vmart1
    explore: inventory_fact
    measures: [inventory_fact.max_qty_in_stock]
    value_format: '#,##0.00'
    listen: 
      date: date_dimension.date_date
    limit: 500
    column_limit: ''
    font_size: small

  - name: breakdown_by_category
    title: Inventory Breakdown by Product Category
    type: looker_column
    model: vmart1
    explore: inventory_fact
    dimensions: [product_dimension.category_description]
    measures: [inventory_fact.average_qty_in_stock]
    listen: 
      date: date_dimension.date_date
    sorts: [inventory_fact.average_qty_in_stock desc]
    limit: 500
    column_limit: ''
    stacking: ''
    show_value_labels: true
    show_view_names: false
    show_null_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto

  - name: Breakdown_by_warehouse_name
    title: Inventory Breakdown by Warehouse 
    type: looker_bar
    model: vmart1
    explore: inventory_fact
    dimensions: [warehouse_dimension.warehouse_name]
    measures: [inventory_fact.average_qty_in_stock]
    listen: 
      date: date_dimension.date_date
    sorts: [inventory_fact.average_qty_in_stock desc]
    limit: 500
    column_limit: ''
    show_null_labels: false
    stacking: ''
    show_value_labels: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_gridlines: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    y_axis_tick_density: default
    x_axis_scale: ordinal
    show_null_points: true
    interpolation: linear
    point_style: none
    y_axis_tick_density_custom: 5
    show_view_names: false
    hide_legend: false
 
#   - name: Breakdown_by_warehouse_location
#     title: Inventory Breakdown by Warehouse Location
#     type: looker_geo_choropleth
#     model: vmart1
#     explore: inventory_fact
#     dimensions: [warehouse_dimension.warehouse_state]
#     measures: [inventory_fact.average_qty_in_stock]
#     listen: 
#       date: date_dimension.date_date
#     sorts: [inventory_fact.average_qty_in_stock desc]
#     limit: 500
#     column_limit: ''
#     show_view_names: false
#     show_null_labels: false
#     stacking: ''
#     show_value_labels: false
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_gridlines: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_gridlines: true
#     y_axis_tick_density: default
#     x_axis_scale: ordinal
#     show_null_points: true
#     interpolation: linear
#     point_style: none
#     y_axis_tick_density_custom: 5
#     hide_legend: false
#     quantize_colors: false
#     map: usa
#     map_projection: ''
#     colors: ['#008000']
#     loading: false

  - name: total_inventory_overtime_by_product
    title: Average Inventory Overtime by Product
    type: looker_line
    model: vmart1
    explore: inventory_fact
    dimensions: [date_dimension.date_month, product_dimension.category_description]
    pivots: [product_dimension.category_description]
    measures: [inventory_fact.average_qty_in_stock]
    listen: 
      date: date_dimension.date_date
    sorts: [date_dimension.date_month]
    limit: 500
    column_limit: ''
    show_view_names: false
    show_value_labels: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_gridlines: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    y_axis_tick_density: default
    hide_legend: false
    x_axis_scale: ordinal
    show_null_labels: false
    show_null_points: true
    interpolation: linear
    point_style: none
    y_axis_tick_density_custom: 5
    colors: ['#776fdf','#49cec1','#e9b404','#dc7350','#ed6168']
    
  - name: total_inventory_overtime
    title: Average Inventory Overtime
    type: looker_line
    model: vmart1
    explore: inventory_fact
    dimensions: [date_dimension.date_month]
    #pivots: [product_dimension.category_description]
    measures: [inventory_fact.average_qty_in_stock]
    listen: 
      date: date_dimension.date_date
    sorts: [date_dimension.date_month]
    limit: 500
    column_limit: ''
    show_view_names: false
    show_value_labels: false
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_gridlines: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    y_axis_tick_density: default
    hide_legend: false
    x_axis_scale: ordinal
    show_null_labels: false
    show_null_points: true
    interpolation: linear
    point_style: none
    y_axis_tick_density_custom: 5
    
    
#   - name: breakdown_by_department
#     title: Inventory Breakdown by Product Department 
#     type: looker_bar
#     model: vmart1
#     explore: inventory_fact
#     dimensions: [product_dimension.category_description, product_dimension.store_department_description]
#     pivots: [product_dimension.store_department_description]
#     measures: [inventory_fact.average_qty_in_stock]
#     listen: 
#       date: date_dimension.date_date
#     sorts: [product_dimension.category_description desc]
#     limit: 500
#     column_limit: ''
#     stacking: percent
#     show_view_names: false
#     hide_legend: false
#     show_value_labels: false
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_gridlines: false
#     x_axis_scale: ordinal
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_gridlines: true
#     y_axis_combined: false
#     show_dropoff: false
#     show_null_labels: false
#     show_null_points: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     
  