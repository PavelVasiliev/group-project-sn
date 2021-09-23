package ru.skillbox.discovery;


import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class Tetst {


    public static void main(String[] args) throws InterruptedException {
        Integer[] arrayNew = new Integer[]{-4,-1,0,3,10};

        Integer[] arraySort = Arrays
                .stream(arrayNew)
                .map(a -> a*a)
                .sorted(Comparator.naturalOrder())
                .toArray(Integer[]::new);

        for (Integer a: arraySort) {
            System.out.println(a);
        }

    }




}

