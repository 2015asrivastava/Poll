from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse,HttpResponseRedirect
from .models import Questions,Choice
from django.urls import reverse
from django.db.models import F
def index(request):
    question_list=Questions.objects.order_by("-pub_date")[:5]
    question_context={
                      "question_list":question_list
                     }
    return render(request,"polls/index.html",question_context)


def detail(request,question_id):
    question=get_object_or_404(Questions,pk=question_id)
    return render(request,"polls/detail.html",{"question":question})


def vote(request,question_id):
    question=get_object_or_404(Questions,pk=question_id)

    try:
        selected_choice=question.choice_set.get(pk=request.POST["choice"])
    except(KeyError,Choice.DoesNotExist):
        return render(request,"polls/detail.html",
                      {
                       "question":question,
                       "error_message":"You didn't select a choice.",
                          })
    else:
      selected_choice.votes=F("votes")+1
      selected_choice.save()

    return HttpResponseRedirect(reverse("polls:results",args=(question.id,)))

                                
def results(request, question_id):
    question = get_object_or_404(Questions, pk=question_id)
    return render(request, 'polls/results.html', {'question': question})


                                                                                
