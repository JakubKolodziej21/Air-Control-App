# Air Control App

![Flutter](https://img.shields.io/badge/Flutter-3.19.2-blue)
![Dart](https://img.shields.io/badge/Dart-3.3.0-blue)

## Opis projektu

To repozytorium zawiera kod źródłowy aplikacji mobilnej napisanej w języku Flutter. Aplikacja służy do sprawdzania pogody, jakości powietrza oraz do losowania zadań do wykonania w wolnym czasie.

## Funkcje

1. **Pogoda**: Aplikacja korzysta z danych zewnętrznego API, aby wyświetlić aktualną pogodę dla wybranej lokalizacji. Użytkownik może sprawdzić temperaturę, wilgotność, prędkość wiatru i inne parametry. Za pomocą naciśniecia ikony pogody, można zmieniać jednostki.

2. **Jakość powietrza**: Aplikacja również pobiera informacje na temat jakości powietrza dla danej lokalizacji, umożliwiając użytkownikowi śledzenie, jak czyste jest powietrze w jego okolicy.

3. **Aktywność**: W zakładce "Aktywność" użytkownik może skorzystać z funkcji losowania zadań do wykonania w czasie wolnym. Api niestety jest na dzień dzisiejszy (IV2024) tylko w języku angielskim. 

## Instalacja

1. Sklonuj repozytorium na swój lokalny komputer:

```bash
git clone https://github.com/twoj_uzytkownik/nazwa_projektu.git
```

2. Wejdź do katalogu projektu:

```bash
cd nazwa_projektu
```

3. Zainstaluj wszystkie zależności za pomocą Fluttera:

```bash
flutter pub get
```

4. Uruchom aplikację na wybranym emulatorze lub urządzeniu:

```bash
flutter run
```

## Wymagania

- Flutter: 3.19.2 lub nowszy
- Dart: 3.3.0 lub nowszy
- Dostęp do internetu (do pobierania danych pogodowych i jakości powietrza)

## Zewnętrzne zasoby

- [API pogodowe](https://openweathermap.org/api)
- [API jakości powietrza](https://aqicn.org/api/pl/)
- [API aktywności](https://www.boredapi.com/)

## Autor

- Jakub Kołodziej (kubikolodziej@gmail.com) - autor projektu

## Licencja

Ten projekt jest objęty licencją [MIT License](https://opensource.org/licenses/MIT).

## Uczelnia

Projekt wykonany na potrzeby uczelni: [Wyższa Szkoła Ekonomii i Informatyki w Krakowie](https://wsei.edu.pl/)
