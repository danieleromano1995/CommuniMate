//
//  CategoriesLibrary.swift
//  CommuniMate
//
//  Created by Jarvis on 19/11/21.
//

import Foundation

struct CategoriesLibrary {
    let keys = ["Pets", "Business", "Healthcare","Hobbies","Life Experience","Music","Games","Literature & Languages","Sport","Food","Tech","Movies & Series"]
    let categories : [String : [String]] = [
        "Pets" : [
            "Do you have any pet at home in this particular moment? Would you like to have one? Which one?",
            "Did you share your house with any pet during your infancy? How was it?",
            "What do you think about captivity?",
            "Have you ever looked in your pets’ eyes and thought they were frighteningly human?",
            "What kind of person would your pet be? What kind of pet would YOU be?",
            "Would you like to keep a legal, exotic animal inside your house?",
            "Have you ever host red fishes at home? What do you think about ‘em?",
            "Would you ever sleep with your pets? Cheek to cheek?",
            "Are you scared of spiders? Would you mind keeping a non-venomous one?",
            "Have you ever thought of your siblings as pets? What kind of animal abilities do they have?",
            "Do your family members like animals? Do you think their opinion has affected you someway?",
            "Do animals usually like you? Do you like petting animals?",
            "If you could keep a wild animal inside your house with no danger or harm, what would it be?",
            "Do you think understanding animals may help your personal growth?",
            "Do you like puppies? What about adopting old pets?",
            "Do barking dogs annoy you? Can you understand why they’re barking only by listening to their tone?"
            ],
        "Business" : [
            "Are you economically independent? How would you like to live your independence?",
            "Do you have any business project for the future?",
            "Do you have a job? Have you ever worked in your life?",
            "Would you actually like to work in your life? What to you think about working?",
            "What would the ideal workplace look like to you?",
            "Are you a practical person? Would you prefer a mental or a physical job?"
            ],
        "Healthcare" : [
            "Do you take care of yourself? How often do you control your health?",
            "Do you have any skin routine? Do you think it would be useful for you?",
            "How many meals do you have during the day? What about Breakfast!",
            "What kind of relationship do you have with medications? Do you easily use them?",
            "How does your body feel right now?",
            "Do you smoke and drink? How often?",
            "Were you a strong or fragile kid? How was your helth?",
            "Do you make your own medical appointments? Who do you rely on and why?",
            "Are you aware of your body limits? Do you think you can overcome them someway?",
            "Do you have any medications at hand? Why not, or why those medications rather than others?",
            "Do you have any nutritional knowledge? (Have you eaten your vegetables??)"
            ],
        "Hobbies" : [
            "Did you ever learn how to sew? Would you like to learn?",
            "What kind of hobbies do you like? Do you have one?",
            "Have you ever though of Bricolage as an interesting hobby?"
            ],
        "Life Experience" : [
            "What kind of relationship do you have with insects?",
            "When it comes to memories, do you remember them trough your Sight, Smell, Touch..?",
            "When asking for life experiences, what kind of answer would you expect to receive?",
            "Did you travel abroad in the past? Do you like to experience the unknown?",
            "Who’s the perfect partner for you during a trip and why? (Family, Friends, yourself..)",
            "How’s you relationship with studying?",
            "What kind of child were you? Curios, shy, annoying?",
            "What’s your opinion about details?",
            "What’s your opinion about life?",
            "What’s your opinion about family?",
            "What’s your opinion about yourself?",
            "What’s you opinion about love?",
            "What kind of knowledge do you think you’ll achieve in 10 years?"
            ],
        "Music" :
            [
            "What’s your favorite music genre? And If there’s more than one, why do you like them all?",
            "Do you pay attention to the lyrics? Are they important for you and why?",
            "Which instrument do you like the most for its sound?",
            "Have you ever tried playing an instrument? How did you feel?",
            "Name a musician who expresses your inner self through their music!",
            "How does music make you feel, physically? Can you try to explain the sensation?",
            "If you were to go to an outdoor concert, would you like to be very close to the stage or would you rather be away from it and why?",
            "Which Volume do you usually set when listening to music?",
            "Which music do you listen to when you need to focus?",
            "Do you have some favourite artists? How did you get to know them?",
            "How many live concert did you attend? What is the one you remember the most?",
            "Is there a specific rhythm that makes you want to move? Which one?",
            "Have you ever listened to Neomelodic music? Do you even know what it is?",
            "Earphones or Headphones, which one do you prefer the most and why?",
            "Which song can’t you get rid of?",
            "How do you usually get to know new music?",
            "Name a music videoclip that surprised you!",
            "Name a musical genre and describe the sensations that evokes in you!"
            ],
        "Games" : [
            "Did you have any videogame console when you were a child?",
            "Is there a videogame you always wanted to play but never could?",
            "Do you like online gaming? What is the game you like the most?",
            "Do you prefer playing outside or inside?"
            ],
        "Literature & Languages" : [
            "What kind of books are in your personal library?",
            "How much do you communicate with gestures? Can you interpret them?",
            "How many languages do you understand and how many of them can you actually speak?",
            "Do you ever read books in their original language? If not, Why don’t you?",
            "Can you remember which is the first book you passionately read?",
            "Have you ever thought about writing down your own book? What would it contain?",
            "Do you usually take breaks while reading?",
            "How do you feel while reading? Do you find it relaxing? Do you find it boring?",
            "Did you have good language teachers while attending school?",
            "Do you enjoy studying languages?",
            "Do you think you can express yourself in the proper way? Do you think reading actually helps?",
            "Can you name a book that helped you during your personal growth? Is there one?",
            "Would you like to learn some other languages? How would you like to learn them?",
            "Have you ever tried learning some sign languages? Do you actually know how to communicate with deaf people?",
            "Do you remember one of the grammatical error you systematically made when you were a child?",
            "How often do you buy new books? Do you actually read them?",
            "What about colourful books' covers: do you think they’re catchy? Do you like ‘em?",
            "Do you care for the integrity of your books or do you consume them till they’re ripped up?",
            "Are there books you've always wanted to read but still haven't? Which ones?",
            "Would you use a book to kill an annoying mosquito? Motivate your answer, you killer!"
            ],
        "Sport" : [
            "What do you like and dislike about physical exercise?",
            "Do you like watching sports on tv? Is there one that surprises you?",
            "What kind of sports did you practice during your life and which one did you enjoy the most?",
            "Do you know or practice any extreme sport? Do they fascinate you?",
            "Did you ever go Jogging? Would you like to go jogging alone?",
            "What kind of sporty-person are you? Going to the gym or looking for some sports?",
            "Did you ever injure yourself while practicing sport? What’s your Achilles’ heel?"
            ],
        "Food" : [
            "Did you like vegetables during your childhood? What about now?",
            "Do you have any food intolerance or allergy? When did you find it out?",
            "Do you like legumes? What’s the best, or only, way for you to eat ‘em?",
            "Do you take your time and seat to eat? What if you don’t have time?",
            "Do you like crowded buffets? What kind of buffet-person are you?",
            "Do you like to cook? Which are your favourite recepies to make?",
            "Do you tend to follow recepies slavishly or you modify them usually? Why you do that?",
            "What’s your favorite pasta recipe? First thing first, do you enjoy pasta?",
            "Do you enjoy trying recipes from abroad? How many different kind of sours did you try?"
            ],
        "Tech" : [
            "Do you always look for newer technologies? Do you like your phone, if you have one?",
            "Do you have a pc? Do you actively use it?",
            "Are you a fast keyboard typer? Do you remember where the keys are?"
            ],
        "Movies & Series" : [
            "Do or don’t you like watching series, and why?",
            "Do or don’t you like watching movies, and why?",
            "How often do you usually watch series and why?",
            "How often do you usually watch movies and why?",
            "Do you prefer to watch alone or in company and why?",
            "How much do talking people during a projection bother you?",
            "Have you ever stop watching a series before the ending? Why did you?",
            "Name three movies that represent you the most!",
            "Which movie have you re-watched the most and why?",
            "Which series have you re-watched the most and why?",
            "Do you like spoilers? Why don’t you?",
            "Have you ever empathized with a particular character? If there are more of them, do they have something in common?",
            "Do you have a favourite genre? Why do you prefer it to others?",
            "What do you think about Cult movies? According to you, what do Cult stand for?",
            "Have you ever cried while watching a film? Did you hide it?",
            "Which movies are in your watching list right now? Don’t you have one?",
            "How do you choose a movie?",
            "How do you choose series?",
            "Do you enjoy watching TV with your family? Did you enjoy it in the past?",
            "Do you prefer watching a movie at home or at the cinema? Motivate your answer.",
            "How much do you like animated movies and cartoons?",
            "What's your favourite childhood cartoon? How often did you watch it?"
            ]
        

    
    ]
}
