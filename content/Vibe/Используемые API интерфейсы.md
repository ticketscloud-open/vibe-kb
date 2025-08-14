[[Vibe/|Vibe]]

## TC Rest API

### Vibe-API

```
GET https://ticketscloud.com/v1/widgets/common
GET https://ticketscloud.com/v1/widgets/common/meta
GET https://ticketscloud.com/v2/resources/orders 
GET https://ticketscloud.com/v2/resources/orders/<TC_ORDER_ID>
```

### Checkpoint

```
GET https://ticketscloud.com/v1/simple/events
GET https://ticketscloud.com/v1/resources/events
GET https://ticketscloud.com/v1/resources/events/<TC_EVENT_ID>
GET https://ticketscloud.com/v1/resources/events/<TC_EVENT_ID>/sets/
GET https://ticketscloud.com/v1/resources/events/<TC_EVENT_ID>/sets/<TC_SET_ID>/tickets
```

### Showroom

```
GET https://ticketscloud.com/v1/services/simple/events
GET https://ticketscloud.com/v1/services/simple/events/<TC_EVENT_ID>
GET https://ticketscloud.com/v1/services/simple/events_filters
```

### Salespoint

```
GET https://ticketscloud.com/v1/resources/orders/<TC_ORDER_ID>
POST https://ticketscloud.com/v1/resources/orders
PATCH https://ticketscloud.com/v1/resources/orders/<TC_ORDER_ID>
PATCH https://ticketscloud.com/v1/resources/orders/<TC_ORDER_ID>
DELETE https://ticketscloud.com/v1/resources/orders/<TC_ORDER_ID>
GET https://ticketscloud.com/v1/services/simple/events
GET https://ticketscloud.com/v1/services/simple/events/<TC_EVENT_ID>
POST https://ticketscloud.com/v1/resources/refund_requests/<refund_request_id>
https://ticketscloud.com/v1/resources/events/<TC_EVENT_ID>
https://ticketscloud.com/v1/orders
```


## GRPC

### Feed

`simple.ticketscloud.com`

- events (sets)

### Vibe

`vibe.ticketscloud.com`

- orders
- venues

## Streams

- events
- orders_done
- partners
- refund_requests