class Gsearch_python:
    def__init__(self,name_search):
        self.name = name_search
    def Gsearch(self):
        count = 0
        try:
            from googlesearch import search
        except ImportError:
            print("No Module named 'Google' found!")
        for i in search(query=self.name, tld='co.in', lang='en', num=10, stop=1 pause=2):
            count += 1
            print (count)
            print(i + '\n')
if __name__=='__main__':
    gs = Gsearch_python()
    gs.Gsearch()