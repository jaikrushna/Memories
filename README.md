
# Memories

App to capture best moments of life with functionality of fetching current location and add video category, description and Name.
Login with OTP verification and enjoy your moments.


## Screenshots

#### Login_Page: 
###### Contains text box to enter mobile number
![App Screenshot](https://user-images.githubusercontent.com/86294906/218183267-f32ea76b-fdce-4225-bb2c-eae31b5c21ff.jpg)



#### OTP_Page: 
###### TextBox to enter OTP and login or option to change mobile number
![App Screenshot](https://user-images.githubusercontent.com/86294906/218183334-69f79cf5-f036-4850-a344-c854631e57af.jpg)



#### OTP_Page: 
###### Demo shown
![App Screenshot](https://user-images.githubusercontent.com/86294906/218183396-2bbd93d1-e758-4b94-973a-38013116c07d.jpg)



#### Screen_to_add_video: 
###### Contains TextBox to enter the Name,Category and description
###### Buttons to capture video,get location and add the moment
![App Screenshot](https://user-images.githubusercontent.com/86294906/218183481-cbfeff41-4110-4b30-9f3a-719d1cb8ec4e.jpg)


#### Screen_to_add_video(Demo): 
![App Screenshot](https://user-images.githubusercontent.com/86294906/218183624-a3a89527-bf38-41f7-86da-e0712f56b93a.jpg)




#### List_of_videos: 
###### Tile contains Name,Category and description
###### Also contains location
![App Screenshot](https://user-images.githubusercontent.com/86294906/218183684-39dfcf3a-efe6-408f-bf4c-a9bbc92cda4b.jpg)


#### Video_Preview: 
###### Priview of video when clicked on the tile and a correct button to go back
![App Screenshot](https://user-images.githubusercontent.com/86294906/218183773-3fe29432-48d3-417c-ad4d-9b90dc47a2d1.jpg)




## Libraries used and their usuage:


#### 1]firebase_core  &  firebase_auth: 
Used for OTP authentication using mobile_number

#### 2]Image_Picker:
Used to capture the video

#### 3]sqflite:
To store the videos captured locally on allocated shared area for app

#### 4]location  &  geocoding  &  geolocator:
Used to get the current location using(GPS) of the user to store it in the videos information

#### 5]Cupertino Items:
To used some defined icons like camera

#### 6]video_player:
Used to play the video when clicked on the tile
