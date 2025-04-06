# 🌡️ IoT Monitoring App - Flutter

A Flutter mobile application that simulates an IoT sensor monitoring system. It allows users to track **temperature** and **wind data** (replacing humidity), with two interaction modes: **manual** and **automatic**.

---

## 🔧 Core Features

### 🎛️ Sensor Modes
- **Manual Mode**
  - Users manually input temperature and wind speed.
  - Data is displayed in a live-updated line chart.
  - Temperature units (°C or °F) are respected and switchable.

- **Automatic Mode**
  - Simulates real-time data generation at periodic intervals.
  - Temperature and wind data are auto-generated.
  - Data is continuously displayed on the chart.
  - The temperature unit is fetched from a fake server.

### 🌬️ Wind Sensor (replaces humidity)
- Displays **wind speed** and **direction**.
- Retrieves real data from the OpenWeather API.
- Includes an animated **compass** showing wind direction relative to phone orientation.

### 🌐 Internationalization (i18n)
- Supports two languages:
  - 🇬🇧 English
  - 🇫🇷 French

### 🎨 Dark/Light Theme
- Users can switch between **light** and **dark** modes from the settings page.
- Theme choice is preserved during navigation.

---

## 📱 Navigation Flow

- **SplashScreen**: Entry point with animated logo.
- **LoginPage**: Basic login screen.
- **HomePage**: Allows sensor selection (temperature / wind) and filtering.
- **SettingsPage**: Lets users change language, theme, and temperature unit.

---

## 📊 Charts (FL Chart)
- Displays temperature and wind data as curves.
- Red curve: temperature.
- Blue curve: wind speed.
- Y-axis adapts automatically to °C or °F.

---

## 🧠 Project Structure

### 📁 `lib/`
- `main.dart`: Application entry point.
- `models/telemetry_point.dart`: Represents a sensor data point.
- `screens/`: Screens for manual mode, auto mode, and more.
- `services/`:
  - `telemetry_simulator.dart`: Simulates temperature & wind data.
  - `fake_server.dart`: Simulates backend temperature unit responses.
- `widgets/`:
  - `data_input_form.dart`: Manual input form.
  - `telemetry_chart.dart`: Displays live data graph.
  - `compass_painter.dart`: Custom compass rendering.
- `pages/wind_page.dart`: UI for wind data.
- `utils/wind_utils.dart`: Converts wind degrees to directions (e.g., NW).
- `providers/`:
  - `temperature_unit_provider.dart`: Global temperature unit manager.
  - `theme_provider.dart`: Global theme manager.

---

## 🛠️ Main Dependencies

```yaml
dependencies:
  flutter:
  fl_chart:
  provider:
  http:
  sensors_plus:
  flutter_localizations:
  intl:
