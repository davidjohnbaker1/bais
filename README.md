# bais

Here you can find a [jsPsych](www.jspsych.org), browser-based implementation of the [Bucknell Auditory Imagery Scale](https://search.proquest.com/docview/1712713310?pq-origsite=gscholar).
In order to run the program open either

* For BAIS-C run ```bais/bais-c.html
* For BAIS-V run ```bais/bais-v.html
* For both run ```bais/bais.html

according to your needs.

After data collection is complete, put all ```.csv``` files in a directory and use the ```analysis/score_bais.R``` script to source the scoring and aggregation functions.

## To Do 

* [ ] Add function that multiplies scores by the factor loadings.
* [ ] Show average scores and factor loaded scores in browser
