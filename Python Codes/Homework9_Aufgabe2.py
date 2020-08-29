from tkinter import *

statuslist = [['Steins:Gate', 'Sci-fi', 'Completed'],
             ['Attack on Titan', 'Horror', 'Completed'],
             ['Jojos Bizarre Adventure', 'Adventure', 'Plan to watch'],
             ['Bleach', 'Fighting', 'Plan to watch']]

def which_selected():
    print("At {0}".format(select.curselection()))
    return int(select.curselection()[0])


def add_entry():
    statuslist.append([titlevar.get(), genrevar.get(), statusvar.get()])
    set_select()


def update_entry():
    statuslist[which_selected()] = [titlevar.get(),
                                   genrevar.get(),
                                   statusvar.get()]


def delete_entry():
    del statuslist[which_selected()]
    set_select()


def load_entry():
    title, genre, status = statuslist[which_selected()]
    titlevar.set(title)
    genrevar.set(genre)
    statusvar.set(status)


def make_window():
    global titlevar, genrevar, statusvar, select
    win = Tk()

    frame1 = Frame(win)
    frame1.pack()

    Label(frame1, text="Title").grid(row=0, column=0, sticky=W)
    titlevar = StringVar()
    title = Entry(frame1, textvariable=titlevar)
    title.grid(row=0, column=1, sticky=W)

    Label(frame1, text="Genre").grid(row=1, column=0, sticky=W)
    genrevar = StringVar()
    genre = Entry(frame1, textvariable=genrevar)
    genre.grid(row=1, column=1, sticky=W)

    Label(frame1, text="Status").grid(row=2, column=0, sticky=W)
    statusvar = StringVar()
    status = Entry(frame1, textvariable=statusvar)
    status.grid(row=2, column=1, sticky=W)

    frame2 = Frame(win)
    frame2.pack()

    b1 = Button(frame2, text="Add", command=add_entry)
    b2 = Button(frame2, text="Update", command=update_entry)
    b3 = Button(frame2, text="Delete", command=delete_entry)
    b4 = Button(frame2, text="Load  ", command=load_entry)
    b5 = Button(frame2, text="Refresh", command=set_select)
    b1.pack(side=LEFT)
    b2.pack(side=LEFT)
    b3.pack(side=LEFT)
    b4.pack(side=LEFT)
    b5.pack(side=LEFT)

    frame3 = Frame(win)
    frame3.pack()
    scroll = Scrollbar(frame3, orient=VERTICAL)
    select = Listbox(frame3, yscrollcommand=scroll.set, height=6)
    scroll.config(command=select.yview)
    scroll.pack(side=RIGHT, fill=Y)
    select.pack(side=LEFT, fill=BOTH, expand=1)
    return win


def set_select():
    statuslist.sort(key=lambda record: record[1])
    select.delete(0, END)
    for title, genre, status in statuslist:
        select.insert(END, "{0}, {1}".format(genre, title))


win = make_window()
set_select()
win.mainloop()