# MyMeal App

MyMeal is a Flutter application that provides a list of meals and their details, fetched from the MealDB API. The app demonstrates the use of state management (Bloc), dependency injection (GetIt), and network handling (Dio) to build a responsive, feature-rich meal browsing experience.

## Features

- **List of Meals**: Displays a list of meals fetched from the API, complete with thumbnail images and categories.
- **Meal Details**: Provides detailed information about each meal, including ingredients, instructions, and YouTube video links.
- **Error Handling**: Includes error screens for network issues, server errors, and loading states.
- **Dependency Injection**: Manages dependencies using GetIt for easy scalability and testing.
- **State Management**: Utilizes Bloc (Cubit) for efficient state handling and UI updates.

## Screenshots

_Include screenshots of the Meal List Screen, Meal Detail Screen, Error Screens, etc._

## Project Requirements

### Technologies

- **Flutter SDK**: Make sure to have Flutter installed on your machine. You can follow the [official installation guide](https://flutter.dev/docs/get-started/install).
- **Dart**: Ensure Dart is installed, as Flutter depends on Dart for its development.
- **MealDB API**: The app fetches data from the [MealDB API](https://www.themealdb.com/api.php).
- **CachedNetworkImage**: Used for loading meal thumbnails with caching support.
- **Dio**: A powerful HTTP client for making API requests.
- **Flutter Bloc**: Used for managing states in a clean and maintainable way.

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/mymeal.git
   cd mymeal
   ```

2. **Install dependencies:**

   Run the following command to install the required dependencies listed in the `pubspec.yaml` file:

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   Use this command to run the app on a connected device or emulator:

   ```bash
   flutter run
   ```

### Project Structure

The project follows a well-structured architecture based on feature separation and clean code principles.

````
lib/
│
├── core/
│   ├── errors/
│   │   └── failure.dart                # Defines custom error handling
│   └── utils/
│       ├── constants.dart              # Application-wide constants
│       ├── state.dart                  # Common state management utilities
│       └── utils.dart                  # Utility functions and helpers
│
├── features/
│   └── meals/
│       ├── bloc/                          # State management using Bloc (Cubit)
│       │   ├── meal_details_cubit.dart    # Manages state for meal detail view
│       │   ├── meal_details_state.dart    # Holds states for meal details
│       │   ├── meals_cubit.dart           # Manages state for meal list view
│       │   └── meals_state.dart           # Holds states for meal list
│       ├── data/                          # Data layer (models, repositories, services)
│       │   ├── models/
│       │   │   └── meal_model.dart        # Defines the Meal model from MealDB API
│       │   ├── repositories/
│       │   │   └── meal_repository.dart   # Repository for handling meal data fetch logic
│       │   └── services/
│       │       └── meal_service.dart      # Network service using Dio for API requests
│       ├── screens/                       # UI screens for the app
│       │   ├── meal_list_screen.dart      # Displays the list of meals
│       │   ├── meal_detail_screen.dart    # Displays meal details
│       └── widgets/                       # Reusable UI components
│           ├── error_widget.dart          # Displays errors in the UI
│           ├── loading_widget.dart        # Shows a loading indicator
│           └── network_error_widget.dart  # Handles network-related errors
│
└── main.dart                              # App entry point and route configuration
````

### Key Components

#### 1. **`MealRepository`**
The repository is responsible for fetching data from the MealDB API through `MealService`. It manages the business logic and converts raw API data into usable models (`Meal`).

#### 2. **`MealService`**
Handles the API calls using Dio, a powerful HTTP client for making GET requests to the MealDB API.

#### 3. **`MealListScreen`**
Displays a list of meals with their categories and thumbnail images. It handles loading, error, and data states using Bloc.

#### 4. **`MealDetailScreen`**
Displays detailed information about a selected meal, including ingredients, instructions, and a YouTube video link if available.

#### 5. **State Management (Bloc)**
- `MealsCubit`: Handles the state of the meal list.
- `MealDetailsCubit`: Handles the state of meal details.

### Error Handling

- **ErrorWidget**: Displays a general error message when something goes wrong.
- **NetworkErrorWidget**: Handles network-related issues, such as no internet connection, and provides a retry button.
- **LoadingWidget**: Displays a loading spinner when data is being fetched.

### API Integration

This app uses the [MealDB API](https://www.themealdb.com/api.php) to fetch meal data. Below are the key API endpoints used in the project:

### Dependency Injection

The app uses **GetIt** for dependency injection to manage services like `Dio`, `MealService`, and `MealRepository`. Dependencies are injected and made available throughout the app.



------------------------------------------------------

### Handling Network Failures and API Errors in Flutter

In this section, I will explain how I implemented strategies to handle network failures and API errors while ensuring a smooth and engaging user experience, even in poor or intermittent network conditions.

#### 1. Efficient Network Libraries
To ensure optimal network performance, I utilized the **Dio** library for making HTTP requests. Dio provides features such as interceptors for logging, handling authentication, and adding custom headers, making it easier to manage and improve network performance.

#### 2. Caching Data
I implemented local caching using the **Hive** library to store data on the user’s device. This prevents unnecessary network requests when the connection is weak or unavailable, allowing the app to display cached data and offer a seamless offline experience.

#### 3. Data Compression
To optimize data transmission over the network, I used data compression techniques, reducing the payload size for large data and images. This results in faster data loading, especially when working with slow connections.

#### 4. Request Optimization
I implemented the following strategies to optimize requests:
- **Pagination**: Fetching data in small chunks to avoid large requests.
- **Field Selection**: Requesting only the necessary fields to reduce payload size.
- **Image Compression**: Compressing images before sending them over the network to reduce load time.

#### 5. Error Handling and Notifications
Proper error handling was a priority. Users are informed of network issues with clear error messages and given the option to retry failed requests. This ensures that users stay engaged and understand the app's current status.

#### 6. Monitoring and Performance Analysis
I used Flutter’s built-in performance tools such as **Flutter Performance Overlay** and network profiling to monitor the app’s network activity and identify bottlenecks, ensuring continuous optimization of the app's performance.

#### 7. Offline Mode
An offline mode was added to allow users to continue interacting with the app even when the internet connection is lost. Cached data is displayed along with a message notifying users that they are offline.

--------------------------------------------------
## AI-Powered Recommendation System for MyMeal App

The AI-powered recommendation system for the MyMeal app suggests meals to users based on the items currently in their shopping cart. The system leverages a **hybrid approach** that combines **Collaborative Filtering**, **Content-Based Filtering**, and advanced **LLM-based embeddings** to deliver personalized and context-aware meal recommendations.

### Steps to Design and Implement the System

### 1. Understand the Objective
The main goal is to recommend meals to users based on the contents of their shopping cart, offering suggestions that:
- Complement the selected meals.
- Align with the user’s taste preferences or dietary restrictions.

### 2. Data Collection and Preprocessing
We collect and preprocess the following data:
- **User Data**: Including the shopping cart, previous orders, browsing history (e.g., meals viewed or favorited), and explicit preferences (e.g., dietary restrictions).
- **Meal Data**: Metadata for each meal, including:
   - Ingredients.
   - Cuisine type (e.g., Italian, Indian, Mexican).
   - Nutritional information (e.g., calories, protein, carbs).
   - Meal categories (e.g., breakfast, lunch, dinner).
   - User reviews and ratings.
   - Price and promotions.

### 3. Model Selection
We use a hybrid recommendation approach that includes:

#### Collaborative Filtering (CF)
- **User-based CF**: Recommends meals that similar users have added to their cart.
- **Item-based CF**: Recommends meals that are frequently purchased together. For example, if users who added *Meal A* to their cart also added *Meal B*, the system would recommend *Meal B* to users who have *Meal A* in their cart.

#### Content-Based Filtering (CBF)
- **Meal Metadata**: The system recommends meals based on the details of the meals in the user’s cart. If the cart contains a vegan meal, the system can recommend other vegan meals or meals with similar ingredients or nutritional profiles.

#### Large Language Models (LLMs) and Embeddings
To further enhance the recommendation system, we leverage **LLMs** (such as OpenAI’s `text-embedding-ada-002`) to generate **semantic embeddings** for meal descriptions and reviews. This allows the system to understand the deeper meaning behind the meal content and make smarter, context-aware recommendations.

- **Embedding Meal Metadata**: Meal descriptions, ingredient lists, and user reviews are converted into vector representations using LLM embeddings. This enables the system to recommend meals that are semantically similar, even if they have different names.
   - For instance, two meals with different names but similar ingredients can be recommended as alternatives.

- **Personalized Recommendations**: By fine-tuning the LLM on user interaction data (e.g., purchase history), the system can predict meals that align with the user’s preferences. The model understands meal types, dietary preferences, and reviews to recommend meals based on the current cart.

### 4. Real-Time Recommendations
Using LLMs, the system provides real-time, contextually relevant recommendations:
- **Contextual Understanding**: The LLMs infer the context of the meals in the cart. For example, if the cart contains pizza and pasta, the system may suggest complementary Italian desserts or appetizers.
- **Complementary Recommendations**: Based on the meals in the cart, the system suggests related items such as:
   - Side dishes, drinks, or desserts that pair well with the main course.
   - Meals that match any dietary restrictions (e.g., gluten-free options).

### 5. Handling Cold Starts
When a user is new or the cart contains meals with limited data, **LLMs** are used to generate **zero-shot recommendations**. By analyzing the semantic meaning of meal descriptions, the system can recommend meals with similar ingredients, cuisines, or dietary preferences, even without historical data.

### 6. Real-Time Interaction and Performance
- **Vector Database**: To ensure efficient retrieval of recommendations, we use a vector database (like **Pinecone** or **MyScale**) to store meal embeddings generated by the LLMs. This allows for fast, real-time semantic search and similarity matching.
- **Streaming Updates**: The recommendation system updates dynamically as the user adds or removes meals from their cart, ensuring that the suggestions remain relevant.

### 7. Model Training and Fine-Tuning
We train and fine-tune the models to improve recommendation accuracy:
- **Collaborative Filtering Models**: User interaction data (e.g., purchase history, cart behavior) is used to train user-based and item-based CF models.
- **Fine-Tune LLMs**: We fine-tune pre-trained LLMs on the app’s specific meal dataset, allowing the models to better understand the nuances of meal descriptions, dietary preferences, and user reviews.

### 8. Evaluation and Optimization
We evaluate and optimize the system to ensure it provides high-quality recommendations:
- **Offline Evaluation**: Metrics such as **Precision@k**, **Recall@k**, and **Mean Reciprocal Rank (MRR)** are used to measure recommendation accuracy.
- **A/B Testing**: The recommendation system is deployed and tested through A/B experiments to assess its impact on user engagement, cart additions, and conversion rates (meal purchases).

### Conclusion
This AI-powered recommendation system utilizes a **hybrid approach** combining Collaborative Filtering, Content-Based Filtering, and **LLM-based embeddings** to deliver personalized, context-aware meal recommendations. By leveraging **LLMs**, the system can provide semantically rich suggestions that align with the user’s preferences and cart contents, ensuring a smoother and more engaging user experience.

----------------------------------------------------

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Author**: Muhammed Alhaj 
**Contact**: [Muhammedalhaj3@gmail.com](mailto:Muhammedalhaj3@gmail.com)

---



