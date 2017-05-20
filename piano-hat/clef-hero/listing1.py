note = 60
with_synth :tb303 do
  22.times do
    play note
    note = note + 1
    sleep 1.25
  end
end
