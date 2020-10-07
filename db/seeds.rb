# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

therapist = Therapist.create name: "John Q Therapist"
client = Client.create name: "Little Boy Johnny", therapist: therapist

ProgressNote.create( title: "/sh/ IWP imitative",
                     note: "/sh/ IWP imitative -++--+++-+ 6/10 60%
errors: sheep, she, shape", therapist: therapist, client: client )

ProgressNote.create( title: "Expressive/Pragmatic Language",
                     note: "Expressive/Pragmatic Language - book (the tiny seed)
STG2: named vocabulary in pictures -visual/verbal/max cues
sun -+
fish +
seed +
bird - -
grass +
snow -
rain -
foot -
flower - -
tree +
Total: 5/13=38%", therapist: therapist, client: client )

ProgressNote.create( title: "STG3: labeled vocabulary",
                     note: "STG3: labeled vocabulary (nouns, verbs) -visual/mod cues:
nouns: +++++ +++ 8/8
errors: 0
verbs: ++ - - - - + 3/7
errors: swim, kick, catch, throw
Total: 10/13=77%", therapist: therapist, client: client )