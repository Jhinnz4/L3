import matplotlib.pyplot as plt
from random import *
import time

###########################################

def TableauAuHasard(n):
    TabHasard=[]
    #
    #  A COMPLETER
    # 
    return TabHasard

def TriFusion(n,T):
    #
    #  A COMPLETER
    #
    return None

def TriBulles(n,T):
    #
    #  A COMPLETER
    #
    return None

def Quicksort(n,T):
    #
    #  A COMPLETER
    #
    return None    

#######Programme Principal########

choix=int(input("Taper 1 pour un test sur un exemple simple, 2 pour un comparatif TriFusion/TriBulles/Quicksort: "))
if choix==1:
    n=6
    T=TableauAuHasard(n)
    print("Tableau de depart: ",T)

    Tbulles=T.copy()
    TriBulles(n, Tbulles)
    print("Apres tri bulles: ",Tbulles)

    Tfusion=T.copy()
    print("Tableau de depart: ",Tfusion)
    TriFusion(n, Tfusion)
    print("Apres tri fusion: ",Tfusion)

    Tquick=T.copy()
    print("Tableau de depart: ",Tquick)
    Quicksort(n, Tquick)
    print("Apres QuickSort",Tquick)
    
else:
    #Valeurs de n choisies    
    abscisses = [n for n in range(1,1000,10)]
    #Temps de calcul
    tps1 = []
    tps2 = []
    tps3 = []
    for n in range(1,1000,10):
        T=TableauAuHasard(n)
        T1=T.copy()
        t=time.time()
        TriBulles(n, T1)
        tps1.append(time.time()-t)
        T2=T.copy()
        t=time.time()
        TriFusion(n, T2)
        tps2.append(time.time()-t)
        T3=T.copy()
        t=time.time()
        Quicksort(n, T3)
        tps3.append(time.time()-t)
    
    #Tracé
    plt.plot(abscisses, tps1, label="Tri bulles")
    plt.plot(abscisses, tps2, label="Tri Fusion")
    plt.plot(abscisses, tps3, label="Quicksort")
    plt.legend(loc="upper left")
    plt.show()
