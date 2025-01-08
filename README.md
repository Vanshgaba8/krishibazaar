
# Krishi Bazaar

Krishi Bazaar is a mobile application designed to provide farmers with direct market access. Built using Flutter, it ensures a seamless and efficient platform for buying and selling agricultural produce. The app leverages modern technologies such as MongoDB, WebSocket, Firebase, and Node.js for its backend operations.

---

## Features

- **Sell Produce**: Farmers can upload product details and images to list their produce for sale.
- **Dynamic Search**: Search for market prices using a search bar for districts or markets.
- **Fetch Market Data**: Integrates with data.gov.in API to display commodity details, including state, district, market, commodity, variety, grade, and pricing (min, max, modal prices).
- **Categorized Product Listings**: Categories like fruits and vegetables to make browsing easy.
- **Order Management**: Farmers can view orders for their products.
- **Secure Sign-Up & Login**: Email verification and validation for secure access.

---

## Technologies Used

- **Frontend**: Flutter using Provider package with MVVM architecture.
- **Backend**: Node.js, MongoDB, WebSocket, and Firebase.
- **API Integration**: data.gov.in API for real-time market data.

---

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Vanshgaba8/krishibazaar.git
   cd krishibazaar
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

Ensure a connected device or emulator is available.

---

## Project Structure

- **`lib/`**: Contains the main application logic.
  - **`models/`**: Data models for MVVM.
  - **`views/`**: UI components and pages.
  - **`viewmodels/`**: Business logic and state management.
- **`assets/`**: Stores images and static resources.
- **`backend/`**: Contains Node.js and Firebase configurations.

---

## Contribution

We welcome contributions to improve Krishi Bazaar. Follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature-name"
   ```
4. Push the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

---


## Contact

For queries, contact [Vansh Gaba](https://github.com/Vanshgaba8).

