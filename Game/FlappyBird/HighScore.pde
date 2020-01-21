class HighScore
{
  public File f = dataFile("HighScore.txt");
  
  public boolean checkFirstRun()
  {
    if (f.isFile()) return true;
    else return false;
  }
}
