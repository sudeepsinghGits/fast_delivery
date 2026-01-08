# Sudeep's Swift Bites 🍔

A high-performance, dynamic food delivery web application built using **Java Servlets**, **JSP**, and **JDBC**. This project replicates the core user flow of industry leaders like Swiggy, focusing on a seamless cart experience and real-time price calculations.


## 🚀 Key Features
### 🛒 Advanced Cart Management
- **Persistence:** Items remain in the cart across sessions using `HttpSession`.
- **Real-time Updates:** Instantly update quantities or remove items with automatic subtotal recalculation.
- **Contextual Navigation:** The "Add More Items" logic intelligently remembers the last restaurant visited to prevent "Menu Not Found" errors.


### 🎟️ Dynamic Coupon System
- **Tiered Discounts:** - `SWIFT50`: 50% OFF up to ₹150.
  - `FLAT100`: Flat ₹100 OFF (Requires minimum order of ₹400).
- **Validation Logic:** Prevents users from applying coupons if they don't meet the minimum spend.
- **Lifecycle Management:** Users can Apply, Change, or Remove coupons, with the bill details updating instantly via Servlet-side session clearing.


### 📱 Responsive UI
- **Mobile-First Design:** Styled with Poppins typography and a clean "card-based" layout.
- **Interactive Modals:** A smooth overlay for selecting available offers.


## 🛠️ Tech Stack
- **Backend:** Java (Jakarta EE), Servlets
- **Frontend:** JSP, CSS3 (Flexbox/Variables), JavaScript
- **Server:** Apache Tomcat 10.x
- **Database:** MySQL



## 🏗️ Project Structure
```text
src/
└── com.food.controller/
    └── CartServlet.java    <-- Handles all cart & coupon logic
└── com.food.model/
    ├── Cart.java          <-- Cart business logic
    ├── CartItem.java      <-- Item data model
webapp/
└── cart.jsp               <-- The dynamic UI and bill calculation

## 🔧 Installation & Setup

Follow these steps to get the project running on your local machine:

1. **Clone the Repository**
   ```bash
   git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git)
   
   Import the Project

2. Open Eclipse or IntelliJ IDEA.
   Go to File > Import > Existing Maven Projects (or Existing Projects into Workspace).
   Select the project folder.
   
3. Configure Database
   Ensure MySQL is installed and running.
   Run your SQL scripts to create the necessary tables.
   Update your DBConnection class (or context.xml) with your MySQL username and password.   
   
4. Setup Apache Tomcat
   Configure Apache Tomcat 10.x in your IDE.
   Right-click the project > Build Path > Configure Build Path > Libraries > Add Library > Server Runtime to link Tomcat.  

5. Deploy and Run
   Right-click the project and select Run As > Run on Server.
   Access the application at: http://localhost:8080/SwiftBites
