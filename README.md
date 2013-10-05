==Spunout API


Routes

+ /
+ /search/:query
+ /service/:id

Notes on DB

+ Service channel/group ID is 5
+ Titles of services are stored in exp_channel_titles (channel_id = 5)
+ Each service's info stored in exp_channel_data (channel_id = 5)
+ Corresponding field titles stored in exp_channels_fields (group_id = 5)

The current field titles for each service data is:

+ 21	heading
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