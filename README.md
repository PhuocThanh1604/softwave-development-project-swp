# HOSTEL MANAGEMENT

Read before coding!

## Review

1. Account - Profile
2. Service Category
3. Service

## Tech

**Database**: MYSQL - MYSQL Workbench 8.0

## Documentation

There are some json format to test API:

# 1. Account - Profile

### Post Method

Paste it into the Body tab of Postman. Remember set JSON instead of TEXT

`POST`
`http://localhost:8181/account/create`

```
{
        "email": "quochbcontact@gmail.com",
        "phone": "0357280613",
        "password": "123456",
        "roleID": null,
        "profile": {
            "fullName": "Huynh Ba Quoc",
            "dob": "30-11-2001",
            "cardNumber": "1154545541"
        }
}

{
        "email": "Adminlogin@gmail.com",
        "phone": "null",
        "password": "1",
        "roleID": null,
        "profile": {
            "fullName": "Huynh Ba Quoc",
            "dob": "21-06-2022",
            "cardNumber": "null"
        }

}


```

### GET Method

#### GET ALL

`GET`
`http://localhost:8181/account/all`

#### GET BY ID

{id} is user's id

`GET`
`http://localhost:8181/account/id/{id}`

`EXAMPLE: `
`http://localhost:8181/account/id/5`

### Put Method

Fill `null` with atttribute you don't want to update

`{id} is user's id`

`PUT`
`http://localhost:8181/account/update/{id}`

```
{
        "email": "quochbcontact@gmail.com",
        "phone": "0357280613",
        "password": "123456",
        "roleID": 1,
        "profile": {
            "fullName": "Huynh Quoc",
            "dob": "30-11-2001",
            "cardNumber": "1154545541"
        }
}
```

`EXAMPLE: You only want to update phone number user id = 5 `

`PUT`
`http://localhost:8181/account/update/5`

Paste it into body tab:

```
{
        "email": null,
        "phone": "0357280453",
        "password": null,
        "roleID": null,
        "profile": {
            "fullName": null,
            "dob": null,
            "cardNumber": null,
        }
}
```

### Put Method

Update fk_role for account

```
http://localhost:8181/account/update/{id}/role/{id}

```

# 2. Role

After categories, we can create role

```
GET   : http://localhost:8181/role/all
DELETE: http://localhost:8181/role/delete/{id}
```

Create Role

```
POST  : http://localhost:8181/role/create
```

```
{
        "name" :"admin",
        "status":"true"
}
{
        "name" :"user",
        "status":"true"
}
```

```
PUT   : http://localhost:8181/role/update/{id}
```

Fill `false` with atttribute you don't want to update

```
{
        "id": 2,
        "name": "user",
        "status": false
    }
```

# 3. Service Category

We have to create categories before inserting service.

### Post Method

Paste it into the Body tab of Postman. Remember set JSON instead of TEXT

`POST`
`http://localhost:8181/servicecategory/create`

```
{
    "name": "Food",
    "status": true
}

```

### GET Method

#### GET ALL

`GET`
`http://localhost:8181/servicecategory/all`

### PUT Method

Fill `null` with atttribute you don't want to update

`{id} is service's category id`

`PUT`
`http://localhost:8181/servicecategory/update/{Id}`

`EXAMPLE: You only want to update status to FALSE `

```
{
    "name": null,
    "status": false
}
```

# 4. Service

After creating categories, we can create services.

```
POST  : http://localhost:8181/service/create
GET   : http://localhost:8181/service/all
DELETE: http://localhost:8181/service/delete/{id}
```

In this section, we focus only on `PUT method`, we have 2 endpoints to update:

1. Only update service's fields:

`PUT`
`http://localhost:8181/service/update/{id}`

```
{
    "name": "Gà Móng Đỏ",
    "img": null,
    "price": 1000.000,
    "quantity": null,
    "status": true,
    "fk_service_cate": null
}
```

Note that `fk_service_cate` is category of the service, we set `null`. Because we have to insert foregin key id of service category instead of a object. But in this case we don't have any foregin key id to insert. So, please set `null`.

2. Set or Update category for the service.

`PUT`
`http://localhost:8181/service/update/{id}/category/{cate_id}`

In this case, we don't need to request any body there. Instead of that this endpoint has two parameter:

1. `{id}`:
   This is service's id that you want to set category for it.
2. `{cate_id}`:
   This is category's id that you want to set it for the service.

Example: I want to set Service's id = 2 has Category's id = 1.
To explain, I want to set `Gà Móng Đỏ` is a ` Food`:

`PUT`
`http://localhost:8181/service/update/2/category/1`

Result:

```
{
    "id": 2,
    "name": "Gà Móng Đỏ",
    "img": null,
    "price": 1000.0,
    "quantity": 80,
    "status": true,
    "serviceCategory": {
        "id": 1,
        "name": "Food",
        "status": true
    }
}


`PUT`
`http://localhost:8181/service/update/2/category/1`
```

# 5. Service Detail

```
DELETE  : http://localhost:8181/servicedetail/delete/{id}
GET  : http://localhost:8181/servicedetail/all

```

CREATE Service Detail
`POST` `http://localhost:8181/servicedetail/create`

```
{
    "quantity": 2,
    "total": 50.000,
    "status": true,
    "service": null,
    "bookinDetail":null
}
```

UPDATE ServiceDetail
`PUT` `http://localhost:8181/servicedetail/update/{id}`

```
 {
        "id": 1,
        "quantity": 2,
        "total": 66.000,
        "status": true,
        "fk_service": null
    }
```

Update `fk_service` is foregin key id to insert for serviceDetail
`PUT` `http://localhost:8181/servicedetail/update/{id}/service/{id}`

```
 {
         "id": 1,
        "quantity": 2,
        "total": 50.0,
        "status": true,
        "service": {
            "id": 1,
            "name": "Sting",
            "img": "https://cdn.tgdd.vn/Products/Images/3226/76520/bhx/nuoc-tang-luc-sting-huong-dau-330ml-201909031559004919.jpg",
            "price": 1000.0,
            "quantity": 10,
            "status": true,
            "serviceCategory": {
            "id": 1,
            "name": "Food",
            "status": true
            },
        "serviceDetails": []
        },
        "fk_booking_detail":null
    }
```

Update `fk_booking_detail` is foregin key id to insert for serviceDetail
`PUT` `http://localhost:8181/servicedetail/update/{id}/bookingdetail/{id}`

# 6. RoomStatus

Detele and search roomstatus

```
DELETE  : http://localhost:8181/roomstatus/delete/{id}
GET  : http://localhost:8181/roomstatus/all

```

Create RoomStatus

```
POST  : http://localhost:8181/roomstatus/create

```

We have 3 type status for room

```
{
"name" :"Booking",
"status":"true"

}
{
        "name": "Valiable",
        "status": true
}
{
        "name" :"Unvaliable",
        "status":"true"

}

```

Update
`PUT` :`http://localhost:8181/roomstatus/update/1`

```
{
"id":1,
"name" :"Booking",
"status":"false"

}
```

# 7. RoomCategory

Create , delete , search

```
DELETE  : http://localhost:8181/roomcategory/delete/{id}
GET  : http://localhost:8181/roomcategory/all

```

CREATE RoomCategory

```
POST  : http://localhost:8181/roomcategory/create
```

```
{
        "name": "Standard",
        "price": 300.000,
        "status": "true"
}
{
        "name": "Vip",
        "price": 800.000,
        "status": "true"
}
{
        "name": "Deluxe",
        "price": 500.000,
        "status": "true"
}
```

UPDATE RoomCategory

```
POST  :http://localhost:8181/roomcategory/update/1
```

```
 {

        "id": 1,
        "name": "Standard",
        "price": 500,
        "status": false
    }
```

# 8. Room

Detele, Search Room

```
DELETE  : http://localhost:8181/room/delete/{id}
GET  : http://localhost:8181/room/all

```

CREATE room

```
PUT    :http://localhost:8181/room/create
```

```
{
        "finishTime" :"2022-09-01",
        "img": "https://parisdelihotel.com/uploads/article/item-1uwlkd8s9l1e955w-793-seafront-premier.jpg",
        "name": "104",
        "price": "500.000",
        "startTime" :"2022-07-01",
        "status":"true",
        "fk_roomcategory": null,
        "fk_roomstatus":null
}
```

Update RoomCategory by ID For room

```
{       "id": 2,
        "name": "104",
        "img": "https://parisdelihotel.com/uploads/article/item-1uwlkd8s9l1e955w-793-seafront-premier.jpg",
        "startTime": "2022-07-01",
        "finishTime": "2022-09-01",
        "price": 800.0,
        "status": true,
        "roomCategory": {
         "id": 1,
        "name": "Deluxe",
        "price": 800.0,
        "status": true
        },
        "roomStatus": null
}
```

Update RoomStatus For room
`PUT` :`http://localhost:8181/room/updatev/{id}/roomstatus/{id}`

# 9. Booking

CREATE booking

```
{         "checkInTime":"2022-08-01",
        "bookingTime":"2022-03-01",
        "checkOutTime" :"2022-08-02",
         "prepayment":500.000,
        "surcharge": null,
        "price": "500.000",
        "status":"true",
        "fk_account":null
}
```

Update `fk_account` is foregin key id to insert for Booking
`PUT` `http://localhost:8181/booking/update/{id}/account/{id}`
Result

```
{
    "id": 1,
    "bookingTime": "2022-03-01",
    "checkOutTime": "2022-08-02",
    "price": 500.0,
    "surcharge": 0.0,
    "prepayment": 500.0,
    "status": true,
    "account": {
        "id": 2,
        "email": "haihung@gmail.com",
        "phone": "0909093311",
        "password": "1",
        "role": null,
        "profile": {
            "id": 2,
            "fullName": "Mai Hai Hung",
            "dob": "12-04-2001",
            "cardNumber": "null"
        }
    },
    "checkInTime": "2022-08-01"
}
```

# 10. BookingDetail

Detele,Search BookingDetail

```
GET   :http://localhost:8181/bookingdetail/all
DELETE :http://localhost:8181/bookingdetail/delete/{id}
```

CREATE Booking Detail
`POST` `http://localhost:8181/bookingdetail/create`

```
{
        "checkInTime":"2022-08-01",
        "bookingTime":"2022-07-01",
        "name": "104R",
        "price": "500.000",
        "checkOutTime" :"2022-09-01",
        "roomID":1,
        "status":"true",
        "total": 900,
        "totalRoom": 500,
        "totalService": 400,
        "fk_booking":null,
        "fk_room":null
}
```

Update `fk_booking` is foregin key id to insert for Booking Detail
`PUT` `http://localhost:8181/bookingdetail/update/{id}/booking/{id}`

Result

```
{
    "id": 1,
    "bookingTime": "2022-07-01",
    "checkOutTime": "2022-09-01",
    "totalService": 400.0,
    "totalRoom": 500.0,
    "total": 900.0,
    "status": true,
    "booking": {
        "id": 1,
        "bookingTime": "2022-03-01",
        "checkOutTime": "2022-08-02",
        "price": 500.0,
        "surcharge": 0.0,
        "prepayment": 500.0,
        "status": true,
        "account": {
            "id": 2,
            "email": "haihung@gmail.com",
            "phone": "0909093311",
            "password": "1",
            "role": null,
            "profile": {
                "id": 2,
                "fullName": "Mai Hai Hung",
                "dob": "12-04-2001",
                "cardNumber": "null"
            }
        },
        "checkInTime": "2022-08-01"
    },
    "room": null,
    "checkInTime": "2022-08-01"
}
```

Update `fk_room` is foregin key id to insert for Booking Detail
`PUT` `http://localhost:8181/bookingdetail/update/{id}/room/{id}`

```
{
    "id": 1,
    "bookingTime": "2022-07-01",
    "checkOutTime": "2022-09-01",
    "totalService": 400.0,
    "totalRoom": 500.0,
    "total": 900.0,
    "status": true,
    "booking": {
        "id": 1,
        "bookingTime": "2022-03-01",
        "checkOutTime": "2022-08-02",
        "price": 500.0,
        "surcharge": 0.0,
        "prepayment": 500.0,
        "status": true,
        "account": {
            "id": 2,
            "email": "haihung@gmail.com",
            "phone": "0909093311",
            "password": "1",
            "role": null,
            "profile": {
                "id": 2,
                "fullName": "Mai Hai Hung",
                "dob": "12-04-2001",
                "cardNumber": "null"
            }
        },
        "checkInTime": "2022-08-01"
    },
    "room": {
        "id": 1,
        "name": "104",
        "img": "https://parisdelihotel.com/uploads/article/item-1uwlkd8s9l1e955w-793-seafront-premier.jpg",
        "startTime": "2022-07-01",
        "finishTime": "2022-09-01",
        "price": 500.0,
        "status": true,
        "roomCategory": {
            "id": 1,
            "name": "Standard",
            "price": 500.0,
            "status": false
        },
        "roomStatus": null
    },
    "checkInTime": "2022-08-01"
}
```


```
