int numData = 300;

SortBase[] sortsRandom = {
  new SimpleSort("simpleSortRandom", numData), 
  new BubbleSort("bubbleSortRandom", numData), 
  new QuickSort("quickSortRandom", numData), 
  new CombSort("combSortRandom", numData), 
};
SortBase[] sortsAlmostSorted = {
  new SimpleSort("simpleSortAlmostSorted", numData), 
  new BubbleSort("bubbleSortAlmostSorted", numData), 
  new QuickSort("quickSortAlmostSorted", numData), 
  new CombSort("combSortAlmostSorted", numData), 
};
SortBase[] sortsAll = (SortBase[])concat(sortsRandom, sortsAlmostSorted);

void setup() {
  size(1200, 300);
  colorMode(HSB, sortsAll.length - 1, 1, 1, 1);
}

void keyPressed() {
  for (SortBase sort : sortsRandom) {
    if (sort.runCount < 1) {
      sort.shuffle();
      thread(sort.name);
    }
  }
  for (SortBase sort : sortsAlmostSorted) {
    if (sort.runCount < 1) {
      sort.randomize(10);
      thread(sort.name);
    }
  }
}

void simpleSortRandom() {
  sortsRandom[0].sort();
}
void bubbleSortRandom() { 
  sortsRandom[1].sort();
}
void quickSortRandom() { 
  sortsRandom[2].sort();
}
void combSortRandom() { 
  sortsRandom[3].sort();
}
void simpleSortAlmostSorted() { 
  sortsAlmostSorted[0].sort();
}
void bubbleSortAlmostSorted() { 
  sortsAlmostSorted[1].sort();
}
void quickSortAlmostSorted() { 
  sortsAlmostSorted[2].sort();
}
void combSortAlmostSorted() { 
  sortsAlmostSorted[3].sort();
}

void draw() {
  background(0);
  float h = (float)height/sortsAll.length;
  for (int i = 0; i < sortsAll.length; i++) {
    SortBase sort = sortsAll[i];
    float w = (float)width/sort.data.length;
    float y = i*h;
    for (int j = 0; j < sort.data.length; j++) {
      float x = j*w;
      if (sort.data[j] == j + 1) {
        fill(i, 1, 1);
      } else {
        fill(0, 0, 1);
      }
      stroke(0, 0, 0.5);
      rect(x, y, w, h);
      //fill(0);
      //textAlign(CENTER, CENTER);
      //textSize(0.4*min(w, h));
      //text("" + sort.data[j], x, y, w, h);
    }
    if (0 < sort.runCount) {
      fill(0, 0, 0);
    } else {
      fill(0, 0, 1);
    }
    textAlign(CENTER, CENTER);
    textSize(0.8*h);
    text(sort.name, 0, y, width, h);
  }
}