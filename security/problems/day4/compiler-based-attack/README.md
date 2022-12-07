1. Build the executables "login" and "login-with-backdoor" by typing "make"
2. Run "time ./login <guessed-password>" multiple times and identify the password (using the timing side-channel attack)
3. Similarly, run "time ./login-with-backdoor <guessed-password>"  multiple times and identify the password
4. Now, run "./login-with-backdoor backdoor".  This works even though "backdoor" is not the actual expected password.
5. Is it possible to change the logic of the "check_password" function (in "password-checker.c") so that the "./login-with-backdoor" program no longer accepts the "backdoor" password?
