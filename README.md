# GitHubClient
Tech Stack: SwiftUI
 
### User Interface
- Login page
  - OAuth authorization using Firebase Auth

- Home Page
  - List repositories of current user
  - Visualize `name`, `star` and `language` data for each repo
  - Search a repo by name

- Profile Page
  - Visualize `name`, `avatar`, `bio`, `followers` and `following` of current user
  - Logout
    
- Common error page

### Network
- Generic network layer
- API integrated:
  - Get a user `GET /users/{username}`
  - Get a user using their ID `GET /user/{account_id}`
  - List repositories for a user `GET /users/{username}/repos`

### Other
- Open source libs used: Firebase, KeyChainSwift and Kingfisher
- Data stored in Keychain
- Support light and dark mode
- Localizations for English and Chinese
- Capability added: Background fetch
- Created a firebase project and a GitHub OAuth project to implement OAuth authorization
