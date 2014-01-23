#SpunOut API
This is the API for [SpunOut](http://spunout.ie) providing access to information of their listed services. 

There are still known bugs and optimizations that can be made and fixed (and hopefully by you!). 
***
##Methods

###GET /v1/service/:id/

Fetches infornmation about a service with the given id. 

Example: http://api.spunout.ie/v1/service/3252

```
{
    "services": [
        {
            "id": 3252,
            "title": "Fit 4 Work",
            "info": null,
            "page": "http://spunout.ie/help/service/fit-4-work",
            "address": {
                "lines": [
                    null,
                    null
                ],
                "city": null,
                "postcode": null,
                "county": null,
                "country": null,
                "latitude": null,
                "longitude": null
            },
            "website": null,
            "email": null,
            "phone": null,
            "hotline": null,
            "hours": null,
            "keywords": null,
            "image": null
        }
    ]
}
```

###GET /v1/search/:term
Fuzzy searches all services for term.

Example: http://api.spunout.ie/v1/search/bullying

```
{
    "count": 2133,
    "services": [
        {
            "id": 1995,
            "title": "Bullying",
            "info": null,
            "page": "http://spunout.ie/help/service/bullying",
            "address": {
                "lines": [
                    null,
                    null
                ],
                "city": null,
                "postcode": null,
                "county": null,
                "country": null,
                "latitude": null,
                "longitude": null
            },
            "website": null,
            "email": null,
            "phone": null,
            "hotline": null,
            "hours": null,
            "keywords": null,
            "image": null
        },
        .......
        
```

###GET /v1/search/by_category/:category
Return services with given category name (found from /v1/categories)

Example: http://api.spunout.ie/v1/search/by_category/teen

```
{
    "count": 7,
    "services": [
        {
            "id": 1274,
            "title": "Teen-Line Ireland",
            "info": "TeenLine Ireland is a national helpline for teenagers. TeenLine provides a listening and support service available at 1800-833-634",
            "page": "http://spunout.ie/help/service/teen-line-ireland",
            "address": {
                "lines": [
                    null,
                    null
                ],
                "city": null,
                "postcode": null,
                "county": null,
                "country": null,
                "latitude": null,
                "longitude": null
            },
            "website": "www.teenline.ie",
            "email": null,
            "phone": "1800 833 634",
            "hotline": null,
            "hours": "Line open 7.00pm to 10.00pm -  7 days.",
            "keywords": "mental health teenline suicide youth self-harm self harm depression teen-line selfharm panic attacks loneliness bullying",
            "image": null
        },
        .......
        
```

###GET /v1/categories
Returns all categories

Example: http://api.spunout.ie/v1/categories

```
{
    "count": 772,
    "categories": [
        "mental",
        "health",
        "teenline",
        "suicide",
        "youth",
        "self",
        "harm",
        "depression",
        "teen",
        "line",
        "selfharm",
        "panic",
        "attacks",
        "loneliness",
        "bullying",
        "bereavement",
        "counselling",
        "stress",
        "anxiety",
        "prevention",
        .....
        
```

###GET /v1/categories/search/:term
Fuzzy searches category names for given term

Example: http://api.spunout.ie/v1/categories/search/teen

```
{
    "count": 154,
    "categories": [
        "teen",
        "teens",
        "teenline",
        "teenager",
        "green",
        "teenagers",
        "beaten",
        "esteem",
        "men",
        "screening",
        "volunteer",
        "antenatal",
        "peer",
        .....
        
```

###GET /v1/nearme

Requires 2 parameters:
+ latitude
+ longitude

returns services near to the provide latitude and longitude

Example: http://api.spunout.ie/v1/latitude=51.899419&longitude=-8.470931

```
{
    "count": 42,
    "services": [
        {
            "id": 1432,
            "title": "St Vincent de Paul - Cork Region",
            "info": "Cork Region SVP is the biggest charitable organisation helping those in need in Cork and has been present in the region since 1846. Throughout the City and County 94 local Conference units and over 800 members, composed of volunteers based in local parishes, work on various projects includingÐ Home visitation, providing financial and practical help; assisting with educational support; caring for the homeless in Cork, through two hostels; hospital and prison visitation.",
            "page": "http://spunout.ie/help/service/st-vincent-de-paul-cork-region",
            "address": {
                "lines": [
                    "Ozanam House",
                    "2, Tuckey Street"
                ],
                "city": null,
                "postcode": null,
                "county": "Cork",
                "country": "Ireland",
                "latitude": "51.896993",
                "longitude": "-8.475266"
            },
            "website": "www.svp.ie",
            "email": "info@svpcork.ie",
            "phone": "021 4270444",
            "hotline": null,
            "hours": "Monday to Friday 9.00am - 1.00pm and 2.00pm - 5.00pm; Wednesdays office opens at 10.00am",
            "keywords": "activism poverty assistance  charity",
            "image": null
        },
        .....
        
```


***

##Notes on DB

+ Service channel/group ID is 5
+ Titles of services are stored in exp_channel_titles (channel_id = 5)
+ Each service's info stored in exp_channel_data (channel_id = 5)
+ Corresponding field titles stored in exp_channels_fields (group_id = 5)

The current field titles for each service data is:

+ 21    heading
+ 23	info
+ 24	address_1
+ 25	address_2
+ 26	city_town
+ 27	postcode 
+ 28	county
+ 29	country
+ 30	website
+ 31	email_address
+ 32	phone_number
+ 33	emergency_hotline
+ 34	opening_hours
+ 35	latitude
+ 36	longtitude
+ 37	keywords
+ 85	service_image
+ 184	emergency_hotline_2
+ 202	branches_offices
+ 203	branches_offices_1
+ 204	branches_offices_2
+ 205	branches_offices_3
+ 206	branches_offices_4
+ 207	branches_offices_5
+ 208	branches_offices_6
+ 209	branches_offices_7
+ 210	branches_offices_8
+ 211	branches_offices_9
+ 212	branches_offices_10
+ 213	branches_offices_11
+ 214	branches_offices_12
+ 215	branches_offices_13
+ 216	branches_offices_14
+ 217	branches_offices_15
+ 218	branches_offices_16
+ 219	branches_offices_17
+ 220	branches_offices_18
+ 221	branches_offices_19
+ 222	branches_offices_20
+ 223	branches_offices_21
+ 224	text_line_instructions
+ 225	text_line_number
+ 226	multiple_offices
+ 279	validation_status_service
+ 280	professional_validator_service
+ 281	youth_proofed_status_service
+ 282	youth_proofer_service
+ 283	date_validated_service
+ 284	date_validated_by_health_pro_ser
+ 285	quarterly_review_status_service
+ 290	email_address_2
+ 291	phone_number_2
+ 292	fax_number
+ 293	phone_1_description
+ 294	phone_2_description
+ 314	is_live
    
