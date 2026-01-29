import 'package:flutter/material.dart';

class AppStrings {
  static String workouts(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Treningi';
      case 'ru':
        return 'Тренировки';
      default:
        return 'Workouts';
    }
  }

  static String noWorkouts(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Brak treningów';
      case 'ru':
        return 'Нет тренировок';
      default:
        return 'No workouts yet';
    }
  }
  static String addWorkout(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Dodaj trening';
      case 'ru':
        return 'Добавить тренировку';
      default:
        return 'Add workout';
    }
  }

  static String workoutName(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Nazwa treningu';
      case 'ru':
        return 'Название тренировки';
      default:
        return 'Workout name';
    }
  }

  static String noDateSelected(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Nie wybrano daty';
      case 'ru':
        return 'Дата не выбрана';
      default:
        return 'No date selected';
    }
  }

  static String pickDate(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Wybierz datę';
      case 'ru':
        return 'Выбрать дату';
      default:
        return 'Pick date';
    }
  }

  static String cancel(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Anuluj';
      case 'ru':
        return 'Отмена';
      default:
        return 'Cancel';
    }
  }

  static String save(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Zapisz';
      case 'ru':
        return 'Сохранить';
      default:
        return 'Save';
    }
  }

  static String enterWorkoutName(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Podaj nazwę treningu';
      case 'ru':
        return 'Введите название тренировки';
      default:
        return 'Enter workout name';
    }
  }
  static String workoutDetails(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Szczegóły treningu';
      case 'ru':
        return 'Детали тренировки';
      default:
        return 'Workout details';
    }
  }

  static String date(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Data';
      case 'ru':
        return 'Дата';
      default:
        return 'Date';
    }
  }

  static String completed(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Zakończono';
      case 'ru':
        return 'Выполнено';
      default:
        return 'Completed';
    }
  }

  static String exercises(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Ćwiczenia';
      case 'ru':
        return 'Упражнения';
      default:
        return 'Exercises';
    }
  }

  static String today(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Dzisiaj';
      case 'ru':
        return 'Сегодня';
      default:
        return 'Today';
    }
  }

  static String upcoming(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Nadchodzące';
      case 'ru':
        return 'Предстоящие';
      default:
        return 'Upcoming';
    }
  }

  static String past(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Poprzednie';
      case 'ru':
        return 'Прошлые';
      default:
        return 'Past';
    }
  }

  static String noExercises(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Brak ćwiczeń.\nKliknij + aby dodać.';
      case 'ru':
        return 'Упражнений нет.\nНажмите + чтобы добавить.';
      default:
        return 'No exercises yet.\nTap + to add one.';
    }
  }

  static String addExercise(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Dodaj ćwiczenie';
      case 'ru':
        return 'Добавить упражнение';
      default:
        return 'Add exercise';
    }
  }

  static String chooseExercise(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Wybierz ćwiczenie';
      case 'ru':
        return 'Выберите упражнение';
      default:
        return 'Choose exercise';
    }
  }

  static String errorLoadingExercises(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Błąd podczas ładowania ćwiczeń';
      case 'ru':
        return 'Ошибка при загрузке упражнений';
      default:
        return 'Error loading exercises';
    }
  }

  static String noExercisesFound(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Nie znaleziono ćwiczeń';
      case 'ru':
        return 'Упражнения не найдены';
      default:
        return 'No exercises found';
    }
  }

  static String sets(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Serie';
      case 'ru':
        return 'Подходы';
      default:
        return 'Sets';
    }
  }

  static String reps(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Powtórzenia';
      case 'ru':
        return 'Повторы';
      default:
        return 'Reps';
    }
  }

  static String weight(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Waga';
      case 'ru':
        return 'Вес';
      default:
        return 'Weight';
    }
  }

  static String kg(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'kg';
      case 'ru':
        return 'кг';
      default:
        return 'kg';
    }
  }

  static String languageEnglish(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Angielski';
      case 'ru':
        return 'Английский';
      default:
        return 'English';
    }
  }

  static String languagePolish(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Polski';
      case 'ru':
        return 'Польский';
      default:
        return 'Polish';
    }
  }

  static String languageRussian(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Rosyjski';
      case 'ru':
        return 'Русский';
      default:
        return 'Russian';
    }
  }

  static String selectLanguage(Locale locale) {
    switch (locale.languageCode) {
      case 'pl':
        return 'Wybierz język';
      case 'ru':
        return 'Выберите язык';
      default:
        return 'Select language';
    }
  }

}
