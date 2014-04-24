jQuery ->
  $("#saved").hide()
  $("#manifesto").draggable()
  loadCounter = 0

  # loading aterisks counter
  $(document).on 'click', '#saved a', (e) ->
    e.preventDefault()
    $("#loader").append "<span class='green' id='loading'>LOADING...</span><br>"
    loading = setInterval () ->
        loadCounter += 1
        if loadCounter > 10 && loadCounter < 60
          $("#loader").append "<span class='green'>*</span>"
          $("#loading").remove()
        if loadCounter == 60
          $("#loader").append "<br><span class='green' id='launching'>LAUNCHING...</span>"
        if loadCounter == 80
          $("#loader").remove()
        if loadCounter > 95
          clearInterval(loading)
          $("#manifesto").show()

      , 80

  totalKeys = 0
  poemKeysPress = 0

  poem = 
    1: 'the_medium = <span class="string">"twitter"</span>'
    2: '<span class="magenta">require</span> the_medium'
    3: 'medium = <span class="green">Twitter</span>::<span class="green">REST</span>::<span class="green">Client</span>.new <span class="yellow">do</span> |<span class="blue">medium</span>|'
    4: '  medium.consumer_key        = <span class="string">"IXzkTsec7GrggycfGtYPg"</span>'
    5: '  medium.consumer_secret     = <span class="string">"GdUKESHAVr0xaDNTAYHP8J9XCZkRENJzhafJkXmLg"</span>'
    6: '  medium.access_token        = <span class="string">"2339810605-vNXXX0y8HnNK4ExTqJsd2G9vx2qVUI<3U4eva"</span>'
    7: '  medium.access_token_secret = <span class="string">"DMWewuD7Wb9DKkvSJlMqCQnXXXX4AnriIOCKrtyk"</span>'
    8: '<span class="yellow">end</span>'
    9: '&nbsp;'
    10: 'virtues = []'
    11: 'virtues << medium.user(<span class="string">"elonmusk"</span>).tweet.text'
    12: 'virtues << medium.user(<span class="string">"KingJames"</span>).tweet.text'
    13: 'virtues << medium.user(<span class="string">"Pontifex"</span>).tweet.text'
    14: 'virtues << medium.user(<span class="string">"KimJongNumberUn"</span>).tweet.text'
    15: 'virtues << medium.user(<span class="string">"Beyonce"</span>).tweet.text'
    16: 'virtues << medium.user(<span class="string">"richardbranson"</span>).tweet.text'
    17: 'virtues << medium.user(<span class="string">"god"</span>).tweet.text'
    18: '<span class="blue"># a moment of clarity</span>'
    19: 'virtues << "<span class="magenta">\n#{</span><span class="green">Faraday</span>.get(<span class="string">"https://api.github.com/zen"</span>).body<span class="magenta">}"</span>'
    20: '&nbsp;'
    21: '&nbsp;'
    22: '<span class="green">File</span>.open(<span class="string">"prophets_manifesto.txt"</span>, <span class="string">"w"</span>) <span class="yellow">do</span> |out|'
    23: '  virtues.each { |<span class="blue">truth</span>| out.puts truth }'
    24: '<span class="yellow">end</span>'
    25: '&nbsp;'
    26: 'system <span class="string">"open prophets_manifesto.txt"</span>'

  window.addEventListener "keypress", (e) ->
    totalKeys +=1 
    maxPressed = 27
    if totalKeys % 3 == 0
      poemKeysPress += 1
      console.log poem[poemKeysPress]
      if poemKeysPress < maxPressed
        $("#poem").append $("<p><span class='yellow'>  #{poemKeysPress}</span> <span class=" + "p" + poemKeysPress + ">" + poem[poemKeysPress] + "</span></p>")
        console.log poem[poemKeysPress].length
      else if poemKeysPress == maxPressed
        $("#saved").show()

