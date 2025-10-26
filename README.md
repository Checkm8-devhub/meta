# Checkmate

Checkmate is an application that allows users to play chess and analyze their games.

## Architecture

It uses microservice architecture.

### Microservices

![architecture image](./readme_assets/Architecture.png)

- **Auth/Users**
    - ```/auth```: Signin, Signup
    - ```/users```: Fetch account/accounts
- **Matchmaking**
    - ```/seeks```: Seek, Cancel
- **Gameplay/Games**
    - ```/games```: Create, Move, Resign, Fetch games, Waiting
- **Analysis**
    - ```/analyses```: Analyze

### Communcation

- **Client -> Auth/Users**
    - *Actions*: Signin, Signup, Account, Fetch account/accounts
- **Client -> Matchmaking**
    - *Actions*: Seek, Cancel
- **Matchmaking -> Gameplay/Games**
    - *Actions*: Create
- **Client -> Gameplay/Games**
    - *Actions*: Move, Resign, Fetch games, Waiting
- **Client -> Analysis**
    - *Actions*: Analyze
- **Analysis -> Gameplay/Games**
    - *Actions*: Fetch games

### DBs
- **Auth/Users -> UsersDB**
- **Gameplay/Games -> GamesDB**

### Active game logic (long-pooling)
1. Client: ```GET /games/{id}/events?since={last_seen_event}```
2. Server: Wait up to 30s for a new event
    - If a new event arrives -> respond with updated events.
    - If no event after 30s  -> respond empty
3. Client: Get response and repeat 1.
