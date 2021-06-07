defmodule Calculator do
  def start() do
    joao = %Student{name: "Joao Joaquim da Silva", results: build_subjects([8.5, 5.6, 9.8, 6.4, 1.5])}
    maria = %Student{name: "Maria Rita da Costa", results: build_subjects([5.5, 7.8, 6.8, 3.4, 8.5])}
    carlos = %Student{name: "Carlos Daniel", results: build_subjects([1.5, 2.6, 9.8, 5.4, 9.5])}
    kaua =	%Student{name: "Kaua Camboinhas",results: build_subjects([5.4,	4.9,	2.2, 3.8])}

    result = calculate([joao, maria, carlos, kaua])
    best = best_results(result)

    %{results: result, bests: best}

  end

  defp build_subjects(results) do
    subjects = ["Portugues", "Matematica", "Fisica", "Quimica", "Biologia"]
    subjects
    |> Enum.map(&(%Subjects{name: &1, result: Enum.random(results)}))
  end

  defp average(student) do
    total = Enum.count(student.results)
    result = student.results
    |> Enum.map(&(&1.result))
    |> Enum.reduce(&(&1 + &2))

    Float.ceil(result / total, 2)
  end

  defp calculate(students) do
    students
    |> Enum.map(&(%{
      first_name: Student.first_name(&1),
      last_name: Student.last_name(&1),
      average: average(&1)
    }))
  end

  def best_results(students) do
    best = students
    |> Enum.map(&(&1.average))
    |> Enum.max

    students
    |> Enum.filter(&(&1.average === best))

  end
end
