from tkinter import * #pip tkinter install
import tkinter as tk # Used for creating the GUI.
from tkinter import ttk
from googletrans import Translator #pip googletrans install and  Used for language translation.
from tkinter import messagebox #pip messagebox install and Used for displaying error messages.
import pyttsx3 #pip pyttsx3 install and  Used for text-to-speech functionality
import threading # Used to run the text-to-speech function in a separate thread.

root = tk.Tk() #Creates the main application window.
root.title('Language Translator')
root.geometry('590x370') #Sets the title and size of the window.

frame1 = Frame(root, width=590, height=370 ,relief=RIDGE, borderwidth=5, bg='#F7DC6F') #Creates a frame within the main window with specific dimensions and styles.
frame1.place(x=0, y=0)

Label(root, text="Language Translator", font=('Helvetica 20 bold'), fg="black", bg='#F7DC6F').pack(pady=10) #Adds a title label to the window.

# Initialize the TTS engine
engine = pyttsx3.init()

def speak(text):
    engine.say(text)
    engine.runAndWait() #mo huwat ni sya og run before mo speak og balik

def translate(): #kini nga function para ni sya sa pag translate
    lang_l = text_entry1.get("1.0", "end-1c") #ang 1.0 nag specify sya sa starting point and ang end-1c kay nag specify sya sa end point
    cl = choose_language.get() #kini nga line kay nag retrieve sya selected language code sa choose_language

    if lang_l == '':
        messagebox.showerror('Language Translator', 'Enter the text to translate!') #kini dri dapit kay nag condition ni sya if ang text kay empty mo prompt ni sya nga line
    else:
        translator = Translator() #kini sya kay gi pasa ang instance nga built in Translator() sa translator nga variable
        output = translator.translate(lang_l, dest=cl) #Kini sya kay  e translate nya ang language sa text_entry1 to the choose_language
        translated_text = output.text #kini sya kay ang output kay e store nya sa translated_text nga variable para dali mailhan nga ang "translated_text" kay na translate na
        text_entry2.delete(1.0, 'end') #kini nga line kay iya e clear ang existing nga text nga naa sa text_entry2
        text_entry2.insert('end', translated_text) #kini nga line kay iya e insert ang translated_text sa text_entry2
        speak(translated_text) #kini nga line kay mo speak ni sya ika display na sa translated nga text

def clear():
    text_entry1.delete(1.0, 'end') 
    text_entry2.delete(1.0, 'end')

def speak_text():
    def speak():
        text = text_entry2.get("1.0", tk.END) 
        engine = pyttsx3.init()
        engine.say(text)
        engine.runAndWait()
        
       
        # Pwede na maka speak balik after humana og speak
        speak_button.config(state=tk.NORMAL)

    # Disable the button while speaking para dli ma redundant iyang pag sulti like "Hel Hel Hello"
    speak_button.config(state=tk.DISABLED)

    # Create a new thread for speaking
    speak_thread = threading.Thread(target=speak) 
    speak_thread.start()

def copy_text():  # Step 2: Define copy_text function
    translated_text = text_entry2.get("1.0", tk.END)
    root.clipboard_clear() #kini nga method kay iya e cleat nga current nga clipboard para ang previous nga data mag pablin pa
    root.clipboard_append(translated_text)  #kini nga method kay iya e append ang   translated_text sa clipboard para pwede sya ma paste 

def paste_text():  
    text_to_paste = root.clipboard_get() #dri kay e retrieve nya ang data sa current nga clipboard
    text_entry1.delete(1.0, 'end')
    text_entry1.insert('end', text_to_paste) #dri nga line kay iya e paste

a = tk.StringVar() #nag himo ra ni sya og StringVar nga object

select = ttk.Combobox(frame1, width=27, textvariable=a, state='readonly', font=('verdana', 10, 'bold')) #mao ni sya nga method nga mag himo og dropdown

select['values'] = (        
                            'Auto-Detect',
                            'English',
                            'Spanish',
                            'French',
                            'German',
                            'Italian',
                            'Portuguese',
                            'Turkish',
                            'Dutch',
                            'Thai',
                            'Vietnamese',
                            'Greek',
                            'Filipino',
                            'Afrikaans',
                            'Icelandic',
                            'Danish',
                            'Estonian',
                            'Japanese',
                         )

select.place(x=15, y=60)
select.current(0)

l = tk.StringVar()
choose_language = ttk.Combobox(frame1, width=27, textvariable=l, state='readonly', font=('verdana, 10 bold'))

choose_language['values'] = (
                            'English',
                            'Spanish',
                            'French',
                            'German',
                            'Italian',
                            'Portuguese',
                            'Turkish',
                            'Dutch',
                            'Thai',
                            'Vietnamese',
                            'Greek',
                            'Filipino',
                            'Afrikaans',
                            'Icelandic',
                            'Danish',
                            'Estonian',
                            'Japanese',
                            )

choose_language.place(x=305, y=60)
choose_language.current(0)

text_entry1 = Text(frame1, width=20, height=7, borderwidth=5, relief=RIDGE, font=('verdana', 15))
text_entry1.place(x=10, y=100)

text_entry2 = Text(frame1, width=20, height=7, borderwidth=5, relief=RIDGE, font=('verdana', 15))
text_entry2.place(x=300, y=100)

btn1 = Button(frame1, command=translate, text="Translate", relief=RAISED, borderwidth=2, font=('verdana', 10, 'bold'), bg='#248aa2', fg="white", cursor="hand2")
btn1.place(x=100, y=300)

btn2 = Button(frame1, command=clear, text="Clear", relief=RAISED, borderwidth=2, font=('verdana', 10, 'bold'), bg="#248aa2", fg="white", cursor="hand2")
btn2.place(x=205, y=300)

speak_button = tk.Button(root, text="Speak", command=speak_text, relief=RAISED, borderwidth=2, font=('verdana', 10, 'bold'), bg="#248aa2", fg="white", cursor="hand2")
speak_button.place(x=300, y=305)

paste_button = Button(frame1, command=paste_text, text="Paste", relief=RAISED, borderwidth=2, font=('verdana', 10, 'bold'), bg="#248aa2", fg="white", cursor="hand2")  # Step 5: Create paste_button
paste_button.place(x=400, y=300)

copy_button = Button(frame1, command=copy_text, text="Copy", relief=RAISED, borderwidth=2, font=('verdana', 10, 'bold'), bg="#248aa2", fg="white", cursor="hand2")  # Step 3: Create copy_button
copy_button.place(x=500, y=300)  # Adjust position if needed

root.mainloop()
