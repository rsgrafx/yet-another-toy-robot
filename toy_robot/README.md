# Toy Robot Simulation

# Installation.

This is mix application with that provides `toy_robot` after setup.


## Setup

`clone this repository`

`cd toy_robot`

`mix escript.build` 

## Running CLI application

`./toy_robot` - this will bring you to a prompt
`>`

`> help` - yields all available commands
```
    Available commands
    > place - # Example usage
      place 1,1 west #default direction is north

    > help - brings up this prompt
    > right - turns robot 90 deg right
    > left - turns robot 90 deg left
    > move - Robot advances current direction one position
```


#### Example Table grid for visualizing robot and verifying reports.
```
[
    [0, 4], [1, 4], [2, 4], [3, 4], [4, 4],
    [0, 3], [1, 3], [2, 3], [3, 3], [4, 3],
    [0, 2], [1, 2], [2, 2], [3, 2], [4, 2],
    [0, 1], [1, 1], [2, 1], [3, 1], [4, 1],
    [0, 0], [1, 0], [2, 0], [3, 0], [4, 0]
]
```