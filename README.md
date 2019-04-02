# Self Analysis 1000 Questions

This app let you browse through 1000 questions from the best-seller book in Japan, "メモの魔力".
Also the app help you keep track of how many questions you have done by providing checkmarks.

## Technical stack:

- CoreData

Library:

- Boris-Em/BEMCheckBox
- Google-Mobile-Ads-SDK

Dependency Manager:
- Carthage
- CocoaPods
![Top image](https://raw.githubusercontent.com/Kazutaka333/magicOfMemo/master/top.png)

## Challenge that I have:
I needed to create a model class by subclassing both Codable and NSManagedObject so that I can decode JSON object and store them into CoreData seemlessly. This was a bit challenging but gave me the deeper understanding of Codable and NSManagedObject.
