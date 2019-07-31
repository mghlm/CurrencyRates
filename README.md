# Currency Rates



*_Currency Rates is an app that let's users add currencies to a list to see exchange rates that updates each second._*



### Approach taken

The app is built using a simple MVVM architecture, where the ViewModel for each screen is responsible for most of the view's business logic as well as navigation. The ViewControllers have been kept simple and "dumb" and only responsible for presenting UI. 

To scale the app, and for further separation of concerns, a coordinator pattern could be introduced for navigation. 

Business logic is tested with unit testing, and all UI is tested with XCUI UI testing. 


The app is built using a protocol oriented approach.



### Technologies used


-  [Swift 5](https://developer.apple.com/swift/)



### How to test it



To test the app simply clone the repo, and build in latest version of Xcode. No need to run any third party library package managers. 

### Conscious decisions

-  Use of JSONSerializer instead of Decodable protocol. As the response for currency pairs is unknown, parsing to a dictionary makes more sense than a predefined Swift model. 

### Known issues

- When user swipes a cell to delete a currency pair, the timer that fetches the rates will pause. This is expected behaviour, since by calling "reloadData()" will reload the cells again and adjust the swiped cell's position back to normal. However, if the user regrets and does not delete the cell, the timer won't start again when swiping the cell back in place again. This is because the "didEndEditingRowAt" method will be called on all cells after each time the tableView is reloaded, so if the timer is set to start in there, it will just start right after being paused again. A solution to this problem would be to not use "reloadData()" but simply update the rate label in the cell every time the new data has been fetched. This way, we could also insert a cell into the tableView when a new pair has been selected, instead of reloading the whole table view as now. This is a design flaw, and something I would do differently if I were to make a similar app again, but due to time constraints this issue is yet to be fixed. 

- In case a currency has been paired with all possible other currencies, it should not be selectable on the first currency picker screen



### Future Improvements / Additions



- Strings and numbers for layout could be moved to Constants
- Navigation should be moved to a dedicated router/coordinator other - it should not be ViewModels responsibility. 



### Screenshots



![alt text](https://i.imgur.com/RSKHSpy.png)



### User stories for MVP:



```

As a user I can see supported currencies in a list view

```

```

As a user I can select two currencies to compare exchange rates 

```

```

As a user I can see my selected currency pairs and their exchange rate in a list view

```

```

As a user I can see the updated exchange rate each second

```

```

As a user I can delete a currency pair

```
