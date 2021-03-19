# README

# Rails Engine

### About this App

This API allows the user to query a programs endpoint to retrieve workout programs based on the sport and equipment passed in.

## Versions

- Ruby 2.5.3

- Rails 5.2.4.3

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>

### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [RSpec](https://github.com/rspec/rspec-rails)
* [JSONAPI](https://github.com/jsonapi-serializer/jsonapi-serializer)


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Installation

1. Fork and Clone the repo
   ```
   git clone [https://github.com/AlexanderOsborne/volt-api]
   ```
2. Install gems
     -- For list of Gems see [here](https://github.com/AlexanderOsborne/volt-api/blob/main/Gemfile)
   ```
   bundle install
   ```
3. Setup the database: 
   
   There is a small seed file to test the endpoint. To set up the database run the following command.
   ```
   Run rake db:{drop,create,migrate,seed} 
   ```
   
4. Run test with Rspec
   ```
   rails s
   ```

5. Launch a local server
   ```
   rails s
   ```

<!-- USAGE EXAMPLES -->
## Usage

This project includes one endpoint. It can be queried with or without a sport parameter but must include an equipment parameter. Example queries below.

  With a sport
  ```
  http://localhost:3000/api/v1/programs?sport=soccer&equipment=bench,dumbbell,barbell
  ```
  
  Without a sport
  ```
  http://localhost:3000/api/v1/programs?equipment=bench,dumbbell,barbell
  ```
If a matching program or programs are found they will be returned in the following format.

  ```
  {
    "data": [
        {
            "id": "9",
            "type": "program",
            "attributes": {
                "id": 9,
                "name": "Womens Intermediate Soccer",
                "sport": {
                    "name": "soccer",
                    "id": 4
                },
                "required_equipment": [
                    {
                        "name": "barbell",
                        "id": 16
                    },
                    {
                        "name": "bench",
                        "id": 17
                    },
                    {
                        "name": "dumbbell",
                        "id": 20
                    }
                ]
            }
        }
    ]
}
  ```
 Multiple programs may be returned.
 ```{
    "data": [
        {
            "id": "1",
            "type": "program",
            "attributes": {
                "id": 1,
                "name": "Womens Intermediate Soccer",
                "sport": {
                    "name": "Soccer",
                    "id": 1
                },
                "required_equipment": [
                    {
                        "name": "barbell",
                        "id": 2
                    },
                    {
                        "name": "bench",
                        "id": 3
                    },
                    {
                        "name": "dumbbell",
                        "id": 6
                    }
                ]
            }
        },
        {
            "id": "2",
            "type": "program",
            "attributes": {
                "id": 2,
                "name": "Womens Beginner Soccer",
                "sport": {
                    "name": "Soccer",
                    "id": 1
                },
                "required_equipment": [
                    {
                        "name": "bench",
                        "id": 3
                    },
                    {
                        "name": "medicine ball",
                        "id": 10
                    }
                ]
            }
        },
        {
            "id": "3",
            "type": "program",
            "attributes": {
                "id": 3,
                "name": "Womens Advanced Soccer",
                "sport": {
                    "name": "Soccer",
                    "id": 1
                },
                "required_equipment": [
                    {
                        "name": "box",
                        "id": 4
                    },
                    {
                        "name": "squat rack",
                        "id": 12
                    },
                    {
                        "name": "stability ball",
                        "id": 14
                    }
                ]
            }
        },
        {
            "id": "6",
            "type": "program",
            "attributes": {
                "id": 6,
                "name": "Climbing Intermediate",
                "sport": {
                    "name": "climbing",
                    "id": 3
                },
                "required_equipment": [
                    {
                        "name": "pullup bar",
                        "id": 11
                    },
                    {
                        "name": "kettlebell",
                        "id": 13
                    },
                    {
                        "name": "stability ball",
                        "id": 14
                    }
                ]
            }
        },
        {
            "id": "7",
            "type": "program",
            "attributes": {
                "id": 7,
                "name": "Power Endurance",
                "sport": {
                    "name": "Football",
                    "id": 2
                },
                "required_equipment": [
                    {
                        "name": "box",
                        "id": 4
                    },
                    {
                        "name": "squat rack",
                        "id": 12
                    },
                    {
                        "name": "kettlebell",
                        "id": 13
                    }
                ]
            }
        }
    ]
}
```

 If no program is found the following will be returned
 ```
 {
    "We couldn't find a program that matched your request": {}
}
 ```


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/AlexanderOsborne/volt-api.svg?style=for-the-badge
[contributors-url]: https://github.com/AlexanderOsborne/volt-api/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/AlexanderOsborne/volt-api.svg?style=for-the-badge
[forks-url]: https://github.com/AlexanderOsborne/volt-api/network/members
[stars-shield]: https://img.shields.io/github/stars/AlexanderOsborne/volt-api.svg?style=for-the-badge
[stars-url]: https://github.com/AlexanderOsborne/volt-api/stargazers
[issues-shield]: https://img.shields.io/github/issues/AlexanderOsborne/volt-api.svg?style=for-the-badge
[issues-url]: https://github.com/AlexanderOsbornee/volt-apio/issues
[license-shield]: https://img.shields.io/github/license/AlexanderOsborne/volt-api.svg?style=for-the-badge
[license-url]: https://github.com/AlexanderOsborne/volt-api/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/alex-osborne
