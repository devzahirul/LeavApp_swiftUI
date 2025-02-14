# Leave App in SwiftUI

A simple iOS application built with **SwiftUI** that allows users to submit leave requests and view a list of upcoming holidays. The app leverages **Firebase** as its backend for data storage and authentication (optional).

---

## Table of Contents
1. [Features](#features)
2. [Demo/Screenshots](#demoscreenshots)
3. [Getting Started](#getting-started)
4. [Project Structure](#project-structure)
5. [Usage](#usage)
6. [Contributing](#contributing)
7. [License](#license)
8. [Contact](#contact)

---

## Features

- **Leave Request Form**  
  Submit new leave requests with details like date range, reason, etc.
  
- **Holiday List**  
  Browse a list of upcoming holidays within the app, retrieved from Firebase.
  
- **Firebase Integration**  
  Store leave requests and holiday data in Firebase. Any changes are reflected immediately in the app.

---

## Demo/Screenshots

| **Leave Request Form**                                  | **Holiday List**                                      |
|:-------------------------------------------------------:|:-----------------------------------------------------:|
| <img src="docs/images/request_form.png" width="250" />  | <img src="docs/images/holiday_list.png" width="250" /> |

*Note: Replace the placeholder images with actual screenshots from your project.*

---

## Getting Started

### Prerequisites

- **Xcode 14 or later**  
- **Swift 5.6 or later**  
- **iOS 14 or later** (deployment target; you can change this in Xcode if needed)  
- An active **Firebase** project

### Installation & Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/YourUsername/LeaveAppSwiftUI.git
   cd LeaveAppSwiftUI
