package edu.qc.qfit;

public class Exercise {
  private final int id;
  private final String name;
  private final int sets;
  private final String repsOrDuration;
  private final int weightLbs;

  public Exercise(int id, String name, int sets, String repsOrDuration, int weightLbs) {
    this.id = id;
    this.name = name;
    this.sets = sets;
    this.repsOrDuration = repsOrDuration;
    this.weightLbs = weightLbs;
  }

  public int getId() { return id; }
  public String getName() { return name; }
  public int getSets() { return sets; }
  public String getRepsOrDuration() { return repsOrDuration; }
  public int getWeightLbs() { return weightLbs; }
}
