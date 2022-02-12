/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/12 12:15:32 by user42            #+#    #+#             */
/*   Updated: 2022/02/12 16:30:42 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/minishell.h"

void	signal_handler(int signal)
{
	if (signal == SIGINT) 
	{
		printf("\n");
		rl_on_new_line();
		rl_replace_line("", 0);
		rl_redisplay();
	}
	else if (signal == SIGQUIT)
		printf("quit\n");
}

static int	mnsh_getcmd(void)
{
	char *line;

	line = NULL;
	line = readline("Minishell\U0001F984>");
	if (!line)
	{
		printf("\n");
		return (-1);
	}
	free(line);
	return (0);
}

void	mnsh_setsignal(void)
{
	signal(SIGINT, signal_handler);
	signal(SIGQUIT, SIG_IGN);
}

int main(int argc, char **argv, char **envp)
{
    int i;

	mnsh_setsignal();
    while (1)
    {
        i = mnsh_getcmd();
        if (i < 0)
            break ;
    }

    return (0);
}