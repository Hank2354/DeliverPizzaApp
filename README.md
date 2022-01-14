![Header](https://i.yapx.ru/QGfcJ.png)

# DeliverPizzaApp
Application for test task for the position Junior iOS Developer

- [About project](#About-project-warning)
    - [Requirements](#Requirements)
    - [API](#Main-block)
    - [Collection with discounts](#Collection-with-discounts)
    - [Dynamic header view](#Dynamic-header-view)
    - [Cell Display](#Cell-Display)
    - [Networking](#Networking)
    - [Offline mode](#Offline-mode)
- [Built With](#Built-With)
- [Project Structure](#Project-Structure-bookmark_tabs)
- [Getting started](#Getting-started-rocket)
- [Presentation](#Presentation-iphone)

## About project :warning:

To fulfill the requirements, I need to implement the main screen of the pizza delivery application.

#### Requirements:
- Implement home screen for food delivery app
- You can hardcode any photo into banners
- The main task is to make an identical bar with categories and a menu block
- Bar with categories when scrolling should stick to the top bar
- When you click on a category, the list should scroll to the corresponding section
- As an API, use any open source suitable for current needs
Optional:
- Offline mode: i.e. in case there is no network access, show the last downloaded data.

### API
 
I used a service to generate a server that will return the API I need.

Source: [Mockend](mockend.com)

I receive an array of data from the server, each element contains information to fill one cell.

Text and images are randomly generated. Selected from pre-prepared.

Detailed information about configuring the API in the file: `.mockend.json`

### Collection with discounts

For convenient display of stocks, I created a successor of `UICollectionViewFlowLayout`

In this file, a detailed way to switch cells and calculate the distance for offset

### Dynamic header view

To dynamically change the height of the top view, I added all the elements to the UIScrollView, 
then I passed an offset to it until the collection with categories was in the right position.

Position is calculated dynamically from screen size

### Cell Display

If the user received data from the network, then I pass a string with a link to the desired image into the cell,
then in the cell itself I get the desired image, and download it, if the cell has gone beyond the screen,
the download stops, otherwise problems may arise (for example, desynchronization pictures and cells)

If the user got the data from the local database, I get the image already from the data. More about it below

### Networking

From the network, we first receive data on the cells, and after the configuration of the cells, we receive data on discounts

The interface is updated in several asynchronous tasks, which avoids lags and freezes

Detailed work with the network in a file: `NetworkManager.swift`

### Offline mode

If, when entering the application, the user does not have an Internet connection, then the application will prompt him to try to get the data again, or, alternatively, download the latest data received during the last download.

Each time the data is loaded, the database is updated with the actual values.

More details in the file: `CoreDataManager.swift` and `ExtenstionCoreDataManager.swift`

## Built With

- Swift language
- Foundation
- UIKit
- CoreData
- VIPER Architecture
- Auto Layout
- GCD
- Only programmaticaly (without storyBoard)
- MultiProgressView
- URLSession

## Getting started :rocket:

The project does not require additional settings to run :heavy_check_mark:

Installing dependencies is not required. The application uses only standard Apple libraries

## Presentation :iphone:

- Presentation Online network mode video   -> [On YouTube :tv:](https://www.youtube.com/watch?v=IDg7lWrEo48)
- Presentation Offline network mode video  -> [On YouTube :tv:](https://www.youtube.com/watch?v=SFUQqLTfYN8)

Screenshots:

| ![](https://i.yapx.ru/QGgT8.png) | ![](https://i.yapx.ru/QGgUD.png) | ![](https://i.yapx.ru/QGgUL.png) | ![](https://i.yapx.ru/QGgUP.png) | 
|----:|:----:|:----:|:----|
