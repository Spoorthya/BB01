# not to worry about minification errors
Batman.config.minificationErrors = false

class WordBump extends Batman.App
      @root 'app#index'

class WordBump.Word extends Batman.Model
      @resourceName: 'word'

      @persist Batman.LocalStorage

      #fields
      @encode 'name', 'rank'

      #custom accessor
      @accessor 'addOneHundred'
        get: -> @get('rank') + 100

class WordBump.AppController extends Batman.Controller
      routingKey: 'app'

      index: ->

        # fill the initial wordlist  @set is used to set the wordlist
        @set 'wordList', @fillWordList()
        console.log (@get 'wordList').length



      fillWordList: ->

        #Set is defined
         tmpWordList = new Batman.Set
         words = ['waffle', 'batman', 'ninja', 'rock', 'paper', 'tree', 'fight', 'tall', 'yellow', 'blue']

         for word in words
           tmpWordList.add new WordBump.Word(name: word, rank: 0)

         tmpWordList

# Start the app
window.WordBump = WordBump
WordBump.run()