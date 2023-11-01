import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

  //map colors
   final Map<String, Color> _moodColors = {
    'Happy': const Color(0xFF00DF59),
    'Tired':const Color(0xFFFFD600),
    'Sad': const Color.fromARGB(255, 110, 160, 3),
    'Angry': const Color(0xFFFF2400),
    'Stressed': const Color(0xFF6E8B7E),
    'Bored': const Color.fromARGB(255, 105, 206, 236),
  };

   Color getColorForMood(String mood) {
    return _moodColors[mood] ?? Colors.blue; // Default color
  }

 // Add a class to represent MoodHistory
  class MoodHistory {
    final DateTime date;
    final String mood;
   

    MoodHistory({
      required this.date,
      required this.mood,
      
    });
    Color get color => getColorForMood(mood);
  }



class MoodProvider with ChangeNotifier {

   MoodProvider() {
    _addInitialMoodsToHistory();
  }

  // Method to add initial mood data to the history
  void _addInitialMoodsToHistory() {
    // addMoodToHistory("Happy", DateTime(2023, 8, 9));
    // addMoodToHistory("Stressed", DateTime(2023, 8, 10));
    // addMoodToHistory("Angry", DateTime(2023, 8, 12));
    addMoodToHistory("Stressed", DateTime(2023, 10, 29));
    addMoodToHistory("Stressed", DateTime(2023, 10, 30));
    addMoodToHistory("Sad", DateTime(2023, 10, 31));
    addMoodToHistory("Happy", DateTime(2023, 11, 1));
    // ... Add more initial mood data as needed ...
  }

  
  int _selectedCount = 0;
  int get selectedCount => _selectedCount;

  String _selectedMood = '';
  String get selectedMood => _selectedMood;

  DateTime? _selectedDateTime; // Add this property
  DateTime? get selectedDateTime => _selectedDateTime;

 
  //display habits relevant to the selected mood
  final Map<String, List<Map<String, dynamic>>> _habitsformood = {
    "happy": [
    {
      "title": "Practice Gratitude",
      "description": "List things you're thankful for",
      "image": "assets/images/mood_tracking/gratitude.jpg",
    },
    {
      "title": "Spread Positivity",
      "description": "Compliment someone",
      "image": "assets/images/mood_tracking/positivity.jpg",
    },
    {
      "title": "Dance to Your Favorite Song",
      "description": "Move to the rhythm and have fun",
      "image": "assets/images/mood_tracking/dance.jpg",
    },
  ],
    "calm" : [
      {
    "title": "Practice Deep Breathing",
    "description": "Inhale deeply and exhale slowly to relax.",
    "image": "assets/images/mood_tracking/deep_breathing.jpg",
    },
    {
      "title": "Meditation Time",
      "description": "Find a quiet space and meditate for a few minutes.",
      "image": "assets/images/mood_tracking/meditation.jpg",
    },
    {
      "title": "Nature Walk",
      "description": "Take a leisurely walk in nature to clear your mind.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
  ],
  // add images
  "tired" :[
    {
      "title": "Power Nap",
      "description": "Take a short 20-minute nap to recharge.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Hydrate",
      "description": "Drink a glass of water to stay hydrated and energized.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Stretch Break",
      "description": "Do some gentle stretches to relieve tension and boost circulation.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
  ],
  "sad" : [
     {
      "title": "Practice Self-Compassion",
      "description": "Be kind to yourself and practice self-care.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Connect with a Friend",
      "description": "Reach out to someone you trust for support.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Engage in Creative Expression",
      "description": "Express your emotions through art, writing, or music.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
  ],
  "angry" : [
    {
      "title": "Take Deep Breaths",
      "description": "Inhale deeply and exhale slowly to calm down.",
      "image": "assets/images/mood_tracking/deep_breathing.jpg",
    },
    {
      "title": "Physical Activity",
      "description": "Engage in physical exercise to release tension.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Practice Mindfulness",
      "description": "Focus on the present moment and let go of anger.",
      "image": "assets/images/mood_tracking/meditation.jpg",
    },
  ],
  "stressed" : [
    {
      "title": "Deep Breathing",
      "description": "Take slow, deep breaths to reduce stress.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Relaxation Techniques",
      "description": "Practice techniques like progressive muscle relaxation.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Listen to Soothing Music",
      "description": "Play calming music to ease stress and anxiety.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
  ],
  "lonely" : [
     {
      "title": "Connect Virtually",
      "description": "Reach out to friends or family through calls or messages.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Engage in a Hobby",
      "description": "Spend time doing something you enjoy and find fulfilling.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Volunteer or Help Others",
      "description": "Contribute to your community and make a positive impact.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
  ],
  "sick" : [
    {
      "title": "Rest and Hydration",
      "description": "Get plenty of rest and stay hydrated to recover.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Warm Tea or Soup",
      "description": "Sip warm tea or soup to soothe your throat and body.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Follow Medical Advice",
      "description": "Adhere to prescribed medications and follow doctor's instructions.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
  ],
  "bored" : [
     {
      "title": "Try a New Recipe",
      "description": "Experiment with cooking a new dish or treat yourself to a meal.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Learn Something New",
      "description": "Take an online course or read about a topic you're curious about.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
    {
      "title": "Engage in Creative Activities",
      "description": "Draw, paint, write, or create something to stimulate your creativity.",
      "image": "assets/images/mood_tracking/nature_walk.jpg",
    },
  ],
   
   
   
  };
  
  List<Map<String, dynamic>> getHabitsForMood(String mood) {
    return _habitsformood[mood] ?? [];
  }

   // Add a map to store selected dates and their corresponding moods
  final Map<DateTime, String> _selectedMoods = {};

  //  String getMoodForSelectedDate(DateTime selectedDateTime) {
  //   return _selectedMoods[selectedDateTime.toLocal()] ?? ''; // Default to empty string if mood is not found
  // }

  // void updateSelectedMoodAndDate(DateTime selectedDateTime) {
  //   _selectedDateTime = selectedDateTime;
  //   _selectedMood = getMoodForSelectedDate(selectedDateTime);
  //   print(_selectedMood);
  //   notifyListeners();
  // }

  void selectMood(String mood, [DateTime? dateTime]) {
    if (_selectedMood == mood) return;
   

    if (_selectedMood.isNotEmpty) {
      _selectedCount--;
    }

    _selectedMood = mood;
    _selectedDateTime = dateTime ?? DateTime.now(); 
    if (_selectedDateTime != null) {
      _selectedMoods[_selectedDateTime!.toLocal()] = mood; // Use the non-nullable value
    }
    _selectedCount++;
    notifyListeners();
  }


 

  // Store the mood history in a list
  final List<MoodHistory> _moodHistory = [];

  // Add a method to get the mood history
  List<MoodHistory> get moodHistory => _moodHistory;

  // Method to add a mood to the history
  void addMoodToHistory(String mood, DateTime dateTime) {
    // final Color moodColor = getColorForMood(mood);
    _moodHistory.add(MoodHistory(date: dateTime, mood: mood));
    notifyListeners();
  }
   
  

    // Compare only the date parts of two DateTime objects
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
    // Method to remove a mood from the history for a specific date
  void removeMoodFromHistory(DateTime dateTime) {
    _moodHistory.removeWhere((history) => _isSameDay(history.date, dateTime));
    notifyListeners();
  }


  
  // final EventList<Event> _markedDateMap = EventList<Event>();

  EventList<Event> getMarkedDateList() {
    final EventList<Event> markedDateList = EventList<Event>(events: {});
    for (var mood in _moodHistory) {
      markedDateList.add(
        mood.date,
        Event(
          date: mood.date,
          icon: CircleAvatar(
            radius: 5,
            backgroundColor: mood.color,
          ),
        ),
      );
    }

    return markedDateList;
  }

 
}








  




