Turtle()
{
  while (not finish) 
  {
    moveleg1();
    moveleg2();
    moveleg3();
    moveleg4();
  }
}

Hare()
{
   while (not finish)
   {
     while (Turtle is far behind)
       Sleep(for_a_while);
     RunLikeCrazy_A_bit();
   }
}

God()
{
  while (game not over)
  {
    wait for keyboard;
    choose hare or turtle from keyboard;
    reposition hare or turtle;
  }
}

Report()
{
   while (game not over)
   {
     report positions of hare and turtle;
     /* use ncurses for graphics if you are ambitious,
        printf otherwise */
   }
}

Main()
{
  fork {
     Tutle();
     Hare();
     God();
     Report();
  } 
  loop until somebody wins;
}
