Shoes.app do
  @poem = stack do
    para "My eyes have blinked again
And I have just realized
This upright world
I have been in.
My eyelids wipe
My eyes hundreds of times
Reseting and renovating
The scenery."
  end
  para(
    link("Clear").click do
      @poem.clear
    end
  )
end
