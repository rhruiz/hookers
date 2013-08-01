- Provides hooks to integrate with Pivotal Tracker
- Generates changelogs descriptions based on standard commit messages and tagging

    To automate your changelog, tag your commit messages:


    To add a bug:


      git commit -m '[BUG #123123] Solving something difficult'


    To add a feature:


      git commit -m '[FEATURE #23434] finishing story'

  
    To add service now items:


      git commit -m '[INC1234] Solving incident'
      git commit -m '[PROV123123] Fixing problem'
      git commit -m '[CHG123123] related to a change request'


    For bugs and stories you can tag several items in the same [ ]:


      git commit -m '[BUG #123 #2134] solving issues'


    You can also tag several different items:


      git commit -m '[PRB123123][INC12312423][BUG #123123][FEATURE #12323345] a lot of work'


      

