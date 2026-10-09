enum BudgetTier { budget, moderate, upscale, luxury }

enum DailyPace { chill, balanced, packed }

enum TripStyle { foodie, culture, nature, cafes, highEnergy, slowTravel }

enum CategoryType {
  temple,
  cafe,
  dining,
  shopping,
  cruise,
  transit,
  activity,
  hotel,
  flight,
}

enum StopStatus { confirmed, reserved, ticketReady, suggested }

enum TripSource { gemini, localDraft }

extension BudgetTierLabel on BudgetTier {
  String get symbol {
    return switch (this) {
      BudgetTier.budget => r'$',
      BudgetTier.moderate => r'$$',
      BudgetTier.upscale => r'$$$',
      BudgetTier.luxury => 'Luxury',
    };
  }

  String get title {
    return switch (this) {
      BudgetTier.budget => r'Budget ($)',
      BudgetTier.moderate => r'Moderate ($$)',
      BudgetTier.upscale => r'Upscale ($$$)',
      BudgetTier.luxury => 'Luxury Experience',
    };
  }
}

extension DailyPaceLabel on DailyPace {
  String get title {
    return switch (this) {
      DailyPace.chill => 'Chill (1-2)',
      DailyPace.balanced => 'Balanced (3-4)',
      DailyPace.packed => 'Packed (5+)',
    };
  }

  String get detail {
    return switch (this) {
      DailyPace.chill => 'Relaxed (1-2 spots/day)',
      DailyPace.balanced => 'Balanced (3-4 spots/day)',
      DailyPace.packed => 'Fast-Paced (5+ spots/day)',
    };
  }

  int get stopsPerDay {
    return switch (this) {
      DailyPace.chill => 2,
      DailyPace.balanced => 4,
      DailyPace.packed => 5,
    };
  }
}

extension TripStyleLabel on TripStyle {
  String get title {
    return switch (this) {
      TripStyle.foodie => 'Foodie & Hidden Gems',
      TripStyle.culture => 'Culture & Temples',
      TripStyle.nature => 'Nature & Scenic Walks',
      TripStyle.cafes => 'Cozy Cafes & Vintage',
      TripStyle.highEnergy => 'High Energy / Fast Pace',
      TripStyle.slowTravel => 'Slow Travel & Relaxed',
    };
  }
}

extension CategoryTypeLabel on CategoryType {
  String get title {
    return switch (this) {
      CategoryType.temple => 'Culture & Heritage',
      CategoryType.cafe => 'Rest & Refuel',
      CategoryType.dining => 'Food',
      CategoryType.shopping => 'Shopping & Tech',
      CategoryType.cruise => 'Water',
      CategoryType.transit => 'Transit',
      CategoryType.activity => 'Activity',
      CategoryType.hotel => 'Stay',
      CategoryType.flight => 'Flight',
    };
  }
}

extension StopStatusLabel on StopStatus {
  String get title {
    return switch (this) {
      StopStatus.confirmed => 'Confirmed',
      StopStatus.reserved => 'Reserved',
      StopStatus.ticketReady => 'Ticket ready',
      StopStatus.suggested => 'Suggested',
    };
  }
}
