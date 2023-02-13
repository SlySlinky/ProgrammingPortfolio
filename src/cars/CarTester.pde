// Connor Soelberg | 24 Oct 2022 | Cars App
Car Bot;
CarBack Cap;
Car[] cars = new Car[5];
CarBack[] reverseCars = new CarBack[5];

void setup() {
  size(200, 200);
  Bot = new Car();
  Cap = new CarBack();
  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car();
  }
  for (int i=0; i<reverseCars.length; i++) {
    reverseCars[i] = new CarBack();
  }
}

void draw() {
  background(127.5);
  line(0, height/2-4, width, height/2-4);
  line(0, height/2+4, width, height/2+4);
  Bot.display();
  Bot.drive();
  Cap.display();
  Cap.driveBack();
  for (int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
  for (int i=0; i<reverseCars.length; i++) {
    reverseCars[i].display();
    reverseCars[i].driveBack();
  }
}
