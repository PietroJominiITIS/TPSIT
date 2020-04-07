#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

#define NCA 5 // number of clients at desk A
#define NCB 5 // number of clients at desk B

int nt = 30,	  // number of tickets available
    rca = NCA, 	// remaining clients at desk A
    rcb = NCB;  // remaining clients at desk B

// mutex used to handle multiple desk
pthread_mutex_t a = PTHREAD_MUTEX_INITIALIZER, // desk A
                b = PTHREAD_MUTEX_INITIALIZER; // desk B

// function executed by clients threads
// desk == 0 => desk A
// desk == 1 => desk B
void buy(void *desk) {

	// lock current desk & decrease remaining clients counter
	if (desk) { pthread_mutex_lock(&a); rca -= 1; }
	else      { pthread_mutex_lock(&b); rcb -= 1; }

	// handle tickets remotions
	int ntb = rand() % 5 + 1, entb;
	if (nt == 0) entb = 0;
	else if (ntb <= nt) { nt -= ntb; entb = ntb; }
	else { entb = nt; nt = 0; }

	// some fancy output
	printf("Thread: %u\n", pthread_self(), desk, ntb, entb);
	printf("\tDesk: \t\t\t%d\n", desk);
	printf("\tTicket requested: \t%d\n", ntb);
	printf("\tTicked bought: \t\t%d\n", entb);
	printf("\tTicker available: \t%d\n", nt);

	// randomly switch desk
	if ((int) rand() % 2) pthread_mutex_unlock(&a);
	else                  pthread_mutex_unlock(&b);

	// handle the situation in which mutex system is locked
	// on a desk that finished clients, breaking the algorithm
	if (rca == 0) pthread_mutex_unlock(&b);
	if (rcb == 0) pthread_mutex_unlock(&a);

	// stop the thread
	pthread_exit(NULL);
}

int main() {

	srand(time(NULL)); // rand seed with current time

	// arrays of client threads
	pthread_t *da = (pthread_t *) malloc(sizeof(pthread_t) * NCA), // desk A
            *db = (pthread_t *) malloc(sizeof(pthread_t) * NCB); // desk B

	// random choice of starting desk
	if ((int) rand() % 2) { pthread_mutex_unlock(&a); pthread_mutex_lock(&b); }
	else                  { pthread_mutex_unlock(&b); pthread_mutex_lock(&a); }

	// client threads creation
	for (int i = 0; i < NCA; i += 1) // desk a
		pthread_create(&da[i], NULL, (void *) buy, (void *) 0);
	for (int i = 0; i < NCB; i += 1) // desk b
		pthread_create(&db[i], NULL, (void *) buy, (void *) 1);

	// waiting for all thread to be stopped
	for (int i = 0; i < NCA; i += 1) pthread_join(da[i], NULL);
	for (int i = 0; i < NCB; i += 1) pthread_join(db[i], NULL);

	return EXIT_SUCCESS;
}
