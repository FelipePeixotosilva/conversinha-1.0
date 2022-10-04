/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fpeixoto <fpeixoto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/10 13:44:42 by fpeixoto          #+#    #+#             */
/*   Updated: 2022/10/04 18:58:41 by fpeixoto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

int	ft_atoi(const char *nptr)
{
	size_t	i;
	int		s;
	int		j;

	i = 0;
	s = 1;
	j = 0;
	while ((nptr[i] >= '\t' && nptr[i] <= '\r') || (nptr[i] == 32))
		i++;
	if (nptr[i] == '-')
	{
		s = -1;
		i++;
	}	
	else if (nptr[i] == '+')
		i++;
	while ((nptr[i] != '\0') && (nptr[i] >= '0' && nptr[i] <= '9'))
	{
		j = j * 10 + (nptr[i] - '0');
		i++;
	}	
	return (j * s);
}

void	convert(int number, int pid)
{
	int	i;
	
		i=0;
	while(i < 8)
	{
	   if(number & (128 >> i))
	   {
	   		kill(pid,SIGUSR1);
	   }
	   else
	   {
		   kill(pid,SIGUSR2);
	   }
	   usleep(600);
		i++;
	}
}
int main(int argc, char *argv[])
{
    int pid;
	int i;

	if(argc == 3)
	{
		pid = ft_atoi(argv[1]);
		i = 0;
		while (argv[2][i])
		{
    		convert(argv[2][i], pid);
			i++;
		}
	}
	else
	{
		write(1,"Problem parameter:",18);
		write(1,"Name_program,PID and string",27);
		write(1,"\n",1);
	}
}
