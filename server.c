/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fpeixoto <fpeixoto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/10 13:52:06 by fpeixoto          #+#    #+#             */
/*   Updated: 2022/10/10 20:47:48 by fpeixoto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# include <unistd.h>
# include <signal.h>

void	ft_putnbr(int n)
{
	int	c;

	if (n == -2147483648)
	{
		write(1, "-2147483648", 11);
		return ;
	}
	if (n == 2147483647)
	{
		write (1, "2147483647", 10);
		return ;
	}
	if (n >= 0 && n <= 9)
	{
		c = n + '0';
		write(1, &c, 1);
	}
	else
	{
		ft_putnbr (n / 10);
		ft_putnbr (n % 10);
	}
}

void	handler(int sig)
{
	static int				nbr;
	static unsigned char	c;

	
	if (sig == SIGUSR1)
	{
		c = c | (128 >> nbr);
	}
	nbr++;
	if (nbr == 8)
	{
		write(1, &c, 1);
		nbr = 0;
		c = 0;
	}
}

int	main(void)
{
	struct sigaction	action;
	int					pid;

	action.sa_handler = handler;
	action.sa_flags = 0;
	pid = getpid();
	write(1, "My pid:", 7);
	ft_putnbr(pid);
	write(1, "\n", 1);
	sigaction (SIGUSR1, &action, NULL);
	sigaction (SIGUSR2, &action, NULL);
	while (1)
		pause();
}
