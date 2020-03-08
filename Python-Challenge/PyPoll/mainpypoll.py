#Python-Challenge p2 PYpoll
#import poll path
import os
import csv 
polltest_csv = os.path.join("R2","election_data.csv")
#print(polltest_csv) #test succesfully 1 try
with open(polltest_csv) as csvfile:
    csvreader=csv.reader(csvfile,delimiter=',')
    #print(csvreader) print test succesfully 1 try
    header_csv=next(csvreader)
    #Stablish list of variables used in the election:
    Voters_id = []
    County= []
    Curr_Candidates = []
    #Stablish list of the Current candidates used in the election:
    Khan = []
    Li = []
    O_Tooley = []
    Correy = []
    #Stablish a loop to get the information of the election from each column using the append function
    for row in csvreader:
        #Voters_id.append(row[0])
        Voters_id.append(int(row[0]))
        County.append(row[1])
        Curr_Candidates.append(row[2])
    electionvotes =(len(Voters_id))
    print(f"The Total of votes gather in this election was {electionvotes}") #Succesfull test try 8 first answer
    #Stablish the conditional to obtain the total of votes per candidate in the election
    for candidate in Curr_Candidates:
        if candidate == "Khan":
            Khan.append(len(Curr_Candidates))
            Khan_votesresults=(len(Khan))
        elif candidate == "Li":
            Li.append(len(Curr_Candidates))
            Li_votesresults=(len(Li))
        elif candidate == "Correy":
            Correy.append(len(Curr_Candidates))
            Correy_votesresults=(len(Correy))
        else: 
            O_Tooley.append(len(Curr_Candidates))
            O_Tooley_votesresults=(len(O_Tooley))
    #print(Khan)
    #print(Correy)
    #print(Li)
    #print(O_Tooley)
    print(f"Candidate Khan Obtained {Khan_votesresults} votes") #test succesful try21
    print(f"Candidate Correy Obtained {Correy_votesresults} votes") #test succesful try21
    print(f"Candidate Li Obtained {Li_votesresults} votes") #test succesful try 21
    print(f"Candidate O´Tooley Obtained {O_Tooley_votesresults} votes") #test succesful try 21
    # Divide the votes of each and candidates with the total of votes in the election
    Khan_Perc = round(((Khan_votesresults/electionvotes)*100),3)
    Correy_Perc = round(((Correy_votesresults/electionvotes)*100),3)
    Li_Perc = round(((Li_votesresults/electionvotes)*100),3)
    O_Tooley_Perc = round(((O_Tooley_votesresults/electionvotes)*100),3)
    print(f"Candidate Khan Obtained {Khan_Perc} % of the votes") #test succesful try13
    print(f"Candidate Correy Obtained {Correy_Perc} % of the votes") #test succesful try13
    print(f"Candidate Li Obtained {Li_Perc} % of the votes") #test succesful try 13
    print(f"Candidate O´Tooley Obtained {O_Tooley_Perc} % of the votes") #test succesful try 13
    # Base on the results, stablish a conditional to determinate the election winner
    Khan_Opposition =(Correy_Perc,Li_Perc,O_Tooley_Perc)
    Correy_Oppostion =(Khan_Perc,Li_Perc,O_Tooley_Perc)
    Li_Opposition =(Correy_Perc,Khan_Perc,O_Tooley_Perc)
    O_Tooley_Opposition =(Correy_Perc,Khan_Perc,O_Tooley_Perc)
    if Khan_Perc> max(Khan_Opposition):
        Cand_winner = "Khan"
    elif Correy_Perc> max(Correy_Oppostion):
        Cand_winner = "Correy"
    elif Li_Perc> max(Li_Opposition):
        Cand_winner = "Li"
    else:
        Cand_winner ="O´Tooley"
    print(f"The winner of the election is {Cand_winner}") #test succesfully 14
    #Print Results in terminal and Export into a Text File
    print(f"---------------------------------------")
    print(f"----------Election Results-------------") 
    print(f"---------------------------------------")
    print(f"Total Votes----------------------{electionvotes}-") 
    print(f"---------------------------------------")
    print(f"Khan: {Khan_votesresults} votes, {Khan_Perc}%")
    print(f"Correy {Correy_votesresults} votes, {Correy_Perc}%") 
    print(f"Li {Li_votesresults} votes, {Li_Perc}%") 
    print(f"O´Tooley {O_Tooley_votesresults} votes, {O_Tooley_Perc}%")
    print(f"----------------------------------------")
    print(f"Winner--------------------{Cand_winner}----------") 
    print(f"----------------------------------------")
electiondata_output = os.path.join('Polldataresults.txt')  
with open(electiondata_output, 'w') as txtfile:
    txtfile.write('\n------------------------------------------------------------------------------')
    txtfile.write('\n----------------------------Election Resutls----------------------------------')
    txtfile.write('\n------------------------------------------------------------------------------')
    txtfile.write(f'\nTotal Votes-----------------------------------------------------------{electionvotes}-')
    txtfile.write('\n------------------------------------------------------------------------------')
    txtfile.write(f'\nKhan: {Khan_votesresults} votes, {Khan_Perc}%')
    txtfile.write(f'\nKhan: {Correy_votesresults} votes, {Correy_Perc}%')
    txtfile.write(f'\nKhan: {Li_votesresults} votes, {Li_Perc}%')
    txtfile.write(f'\nKhan: {O_Tooley_votesresults} votes, {O_Tooley_Perc}%')
    txtfile.write(f'\nWinner----------------------------------------------------------{Cand_winner}---------')
    txtfile.write('\n------------------------------------------------------------------------------')
    txtfile.write('\n------------------------------------------------------------------------------')
    txtfile.write('\nStudent--------------------------------------Jorge Alberto Muñozcano Castro---')


    










