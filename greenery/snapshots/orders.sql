{% snapshot orders_snapshot %}

  {{
    config(
      target_database = 'dev_db',
      target_schema = 'dbt_smikawaucscedu',
      unique_key='order_id',
      strategy='check',
      check_cols=['status']
    )
  }}

  SELECT order_id, user_id, promo_id, address_id, created_at, order_cost, shipping_cost, order_total, tracking_id, shipping_service, estimated_delivery_at, delivered_at, status
  FROM {{ source('postgres', 'orders') }}

{% endsnapshot %}