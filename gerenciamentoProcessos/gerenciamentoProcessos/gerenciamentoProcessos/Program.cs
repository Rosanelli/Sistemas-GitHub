using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace gerenciamentoProcessos
{
    class Program
    {
        static void Main(string[] args)
        {
            int numProcessos;
            int tempEsperaChamado;
            bool pausaProcessador = false;
            int pid = 0;
            int numUltimo_Processo_Executado = 0;
            List<Processo> processos = new List<Processo>();

            Console.WriteLine("Numero Processos ?");
            numProcessos = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Tempo Espera ?");
            tempEsperaChamado = Convert.ToInt32(Console.ReadLine());


            int processosCriados = 0;

            do //Ciclo CPU
            {
                if (processosCriados < numProcessos)
                {
                    // Cria processo --------------------
                    Processo processo = new Processo();
                    processo._Pid = pid;
                    processo._Nome = "Processo " + pid;
                    processo._Estado = 0;

                    processos.Add(processo);
                }

                processosCriados++;
                //------------------------------------

                //mostra processos-------------------------------------------------------

                Console.WriteLine("  ");
                Console.WriteLine("Ciclo CPU " + pid);

                if (pid == 6)
                {
                }

                for (int i = 0; i < processos.Count(); i++)
                {
                    string estado = "";
                    if (processos[i]._Estado == 0)
                        estado = "Criação";

                    if (processos[i]._Estado == 1)
                        estado = "Apto";

                    if (processos[i]._Estado == 2)
                        estado = "Execução";

                    if (processos[i]._Estado == 3)
                        estado = "Destruição";

                    Console.WriteLine(processos[i]._Nome + " - " + estado);
                }
                //------------------------------------------------------------------------

                Thread.Sleep(tempEsperaChamado * 1000);


                // Executa Processo ------------------


                if (processos[numUltimo_Processo_Executado]._Estado == 3)
                {
                    processos.RemoveAt(numUltimo_Processo_Executado);
                    numUltimo_Processo_Executado = numUltimo_Processo_Executado - 1;
                }

                if (numUltimo_Processo_Executado >= 0)
                {
                    processos[numUltimo_Processo_Executado]._Estado = processos[numUltimo_Processo_Executado]._Estado + 1;
                }

                if (processos.Count() == 0)
                    pausaProcessador = true;
                //------------------------------------

                pid++;
                numUltimo_Processo_Executado++;

                if (numUltimo_Processo_Executado == (numProcessos))
                    numUltimo_Processo_Executado = 0;


            } while (pausaProcessador == false);

        }
    }
}
