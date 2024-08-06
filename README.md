## Flutter WebSocket Client
This project is a Flutter application that connects to a WebSocket to display real-time data.

### Objective
The objective of this project is to build a Flutter app that connects to a WebSocket, listens for data streams, and updates the UI with the latest received data in real-time.

### Approach
- **Initial Setup**: Configured Flutter with necessary dependencies.
- **WebSocket Service**: Implemented a service to manage WebSocket connections and handle data streams.
- **State Management**: Utilized `provider` and `ChangeNotifier` for efficient state updates and UI management.
- **UI**: Designed a straightforward UI to display the latest data in a button.


### How we increased performance
- **State Management**: By replacing setState with provider, we avoided constant rebuilding of the UI. This made the app more responsive as provider allowed us to manage state changes more effectively without impacting the entire widget tree.
- **Data Handling**: We optimized how data from the WebSocket was processed and displayed. Instead of handling every piece of data, we focused on updating only the elements that needed it, which improved the app’s responsiveness and reduced unnecessary operations.
- **Resource Management**: The dispose method is crucial for managing resources. Without it, WebSocket connections might remain open, leading to potential memory leaks and performance degradation. By using dispose, we ensured that the WebSocket connection is properly closed when no longer needed, preventing resource leaks and maintaining optimal app performance.

## How to Run

1. Clone the repository:
   ```sh
   git clone https://github.com/Brijesh-26/test_trade_assignment_submission.git

2. Navigate to the directory:
   ```sh
   cd test_trade_assignment_submission

3. Install dependencies:
   ```sh
   flutter pub get

4. Run the app:
   ```sh
   flutter run




