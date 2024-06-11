enum MenuState {
  GAME,
    MAIN_MENU,
    CHARACTER_SELECTION,
    HISTORY
}

enum MenuOption {
  PLAY,
    HISTORY,
    QUIT
}

enum CharacterOption {
  SQUIRREL,
    BIRD,
    MONKEY,
    BACK
}

class Menu {
  MenuState currentState = MenuState.MAIN_MENU;
  MenuOption currentOption = MenuOption.PLAY;
  CharacterOption currentCharacter = CharacterOption.SQUIRREL;

  // Colors
  final color BG_COLOR = color(0x008000); // Green background
  final color BUTTON_COLOR = color(0x333333); // Dark gray color for better visibility
  final color HIGHLIGHT_COLOR = color(255, 0, 0);
  final color TEXT_COLOR = color(255);
  final color HISTORY_BG_COLOR = color(255); // White background for history text
  final color HISTORY_TEXT_COLOR = color(255); // White text for history

  // Button dimensions and spacing
  final int BUTTON_WIDTH = 150;
  final int BUTTON_HEIGHT = 40;
  final int BUTTON_SPACING = 50;

  void display() {
    //background(BG_COLOR);

    if (currentState == MenuState.MAIN_MENU) {
      displayMainMenu();
    } else if (currentState == MenuState.CHARACTER_SELECTION) {
      displayCharacterSelection();
    } else if (currentState == MenuState.HISTORY) {
      displayHistory();
    }
  }

  void displayMainMenu() {
    // Display menu title
    textAlign(CENTER, CENTER);
    textSize(24);
    fill(TEXT_COLOR);
    text("Falling Animal Food", width / 2, height / 4);

    // Draw buttons
    rectMode(CENTER);
    int startY = height / 2 - 60;
    drawButton(width / 2, startY, BUTTON_WIDTH, BUTTON_HEIGHT, "1. Play");
    drawButton(width / 2, startY + BUTTON_SPACING, BUTTON_WIDTH + 70, BUTTON_HEIGHT, "2. History");
    drawButton(width / 2, startY + 2 * BUTTON_SPACING, BUTTON_WIDTH - 50, BUTTON_HEIGHT, "3. Quit");

    // Highlight the current option
    highlightOption(startY);
  }

  void displayCharacterSelection() {
    // Display character selection title
    textAlign(CENTER, CENTER);
    textSize(24);
    fill(TEXT_COLOR);
    text("Select Your Character", width / 2, height / 4);

    // List characters
    int startY = height / 2 - 60;
    drawButton(width / 2, startY, BUTTON_WIDTH, BUTTON_HEIGHT, "Squirrel - Hard");
    drawButton(width / 2, startY + BUTTON_SPACING, BUTTON_WIDTH, BUTTON_HEIGHT, "Bird - Medium");
    drawButton(width / 2, startY + 2 * BUTTON_SPACING, BUTTON_WIDTH, BUTTON_HEIGHT, "Monkey - Easy");
    drawButton(width / 2, startY + 3 * BUTTON_SPACING, BUTTON_WIDTH, BUTTON_HEIGHT, "Back");

    // Highlight the current character
    highlightCharacterOption(startY);
  }

  void displayHistory() {
    //background(HISTORY_BG_COLOR);
    fill(HISTORY_TEXT_COLOR);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("Em uma pacata floresta brasileira, três animais de diferentes espécies se tornaram amigos inseparáveis. César, o macaco mais preguiçoso da floresta, Alvin, um rápido mas pequeno esquilo, e Pedro, um pássaro hiperativo que quer fazer tudo ao mesmo tempo. Certo dia, os três amigos se viram em uma situação crítica: uma construtora chegou na floresta onde habitam e começou a cortar todas as árvores. Desesperados, eles perceberam que precisavam coletar o máximo de alimento possível antes que todas as árvores fossem derrubadas, pois as frutas que caem no chão são destroçadas e não podem ser aproveitadas. Agora, cada um deles deve usar suas habilidades únicas para coletar as frutas e nozes caindo das árvores para sobreviverem.", width / 2, height / 2, width - 100, height);

    // Draw back button
    drawButton(width / 2, height - 50, BUTTON_WIDTH, BUTTON_HEIGHT, "Back");
  }

  void drawButton(float x, float y, float w, float h, String label) {
    fill(BUTTON_COLOR);
    rect(x, y, w, h);
    fill(TEXT_COLOR);
    textSize(20);
    text(label, x, y);
  }

  void highlightOption(int startY) {
    fill(HIGHLIGHT_COLOR);
    switch (currentOption) {
    case PLAY:
      rect(width / 2, startY, BUTTON_WIDTH, BUTTON_HEIGHT);
      fill(TEXT_COLOR);
      text("1. Play", width / 2, startY);
      break;

    case HISTORY:
      rect(width / 2, startY + BUTTON_SPACING, BUTTON_WIDTH + 70, BUTTON_HEIGHT);
      fill(TEXT_COLOR);
      text("2. History", width / 2, startY + BUTTON_SPACING);
      break;

    case QUIT:
      rect(width / 2, startY + 2 * BUTTON_SPACING, BUTTON_WIDTH - 50, BUTTON_HEIGHT);
      fill(TEXT_COLOR);
      text("3. Quit", width / 2, startY + 2 * BUTTON_SPACING);
      break;
    }
  }

  void highlightCharacterOption(int startY) {
    fill(HIGHLIGHT_COLOR);
    switch (currentCharacter) {
    case SQUIRREL:
      rect(width / 2, startY, BUTTON_WIDTH, BUTTON_HEIGHT);
      fill(TEXT_COLOR);
      text("Squirrel - Hard", width / 2, startY);
      break;

    case BIRD:
      rect(width / 2, startY + BUTTON_SPACING, BUTTON_WIDTH, BUTTON_HEIGHT);
      fill(TEXT_COLOR);
      text("Bird - Medium", width / 2, startY + BUTTON_SPACING);
      break;

    case MONKEY:
      rect(width / 2, startY + 2 * BUTTON_SPACING, BUTTON_WIDTH, BUTTON_HEIGHT);
      fill(TEXT_COLOR);
      text("Monkey - Easy", width / 2, startY + 2 * BUTTON_SPACING);
      break;

    case BACK:
      rect(width / 2, startY + 3 * BUTTON_SPACING, BUTTON_WIDTH, BUTTON_HEIGHT);
      fill(TEXT_COLOR);
      text("Back", width / 2, startY + 3 * BUTTON_SPACING);
      break;
    }
  }

  void on_key_pressed() {
    if (currentState == MenuState.MAIN_MENU) {
      handleMainMenuInput();
    } else if (currentState == MenuState.CHARACTER_SELECTION) {
      handleCharacterSelectionInput();
    } else if (currentState == MenuState.HISTORY) {
      handleHistoryInput();
    }
  }

  void handleMainMenuInput() {
    switch (keyCode) {
    case UP:
      currentOption = MenuOption.values()[(currentOption.ordinal() + 2) % 3];
      break;

    case DOWN:
      currentOption = MenuOption.values()[(currentOption.ordinal() + 1) % 3];
      break;

    case ENTER:
      switch (currentOption) {
      case PLAY:
        currentState = MenuState.CHARACTER_SELECTION;
        break;

      case HISTORY:
        currentState = MenuState.HISTORY;
        break;

      case QUIT:
        println("Quitting game...");
        exit(); // Exit the program
        break;
      }
      break;
    }
  }

  void handleCharacterSelectionInput() {
    switch (keyCode) {
    case UP:
      currentCharacter = CharacterOption.values()[(currentCharacter.ordinal() + 3) % 4];
      break;

    case DOWN:
      currentCharacter = CharacterOption.values()[(currentCharacter.ordinal() + 1) % 4];
      break;

    case ENTER:
      PVector start_position = new PVector(width/2, height-50, 0);
      currentState = MenuState.GAME;
      remaning_lifes = 3;
      nutts_collected = 0;
      nutts.clear();
    
      switch (currentCharacter) {
      case SQUIRREL:
        println("Starting game with character: Squirrel");
        animal = new Squirrel(start_position);
        break;

      case BIRD:
        println("Starting game with character: Bird");
        // Add code to start the game with the Bird character
        animal = new Bird(start_position);
        break;

      case MONKEY:
        println("Starting game with character: Monkey");
        // Add code to start the game with the Monkey character
        animal = new Monkey(start_position);
        break;

      case BACK:
        currentState = MenuState.MAIN_MENU;
        break;
      }
      break;
    }
  }

  void handleHistoryInput() {
    switch (keyCode) {
    case ENTER:
      currentState = MenuState.MAIN_MENU;
      break;
    }
  }
}
