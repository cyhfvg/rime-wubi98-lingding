#!/usr/bin/env python3
from colorama import Fore, Style
import argparse
import colorama
import threading
import time
import traceback

"""
python3 ./001-convert-98-dict.py -id /path/to/wubi98_dz.dict.yaml -od output/dz_yaml.txt -ic /path/to/wubi98_ci.dict.yaml -oc output/ci_yaml.txt
"""


g_input_dz_path = "__not_exist_path__"
g_input_ci_path = "__not_exist_path__"
g_output_dz_path = "__not_exist_path__"
g_output_ci_path = "__not_exist_path__"

g_dz_holder = dict()
g_ci_holder = dict()

def debug_print(level: str, msg: str) -> str:
    result_msg = ""
    prompt = ""
    if level.upper() == "error".upper():
        prompt: str = f"{Fore.RED}[ERROR]{Style.RESET_ALL}"
    elif level.upper() == "debug".upper():
        prompt: str = f"{Fore.YELLOW}[DEBUG]{Style.RESET_ALL}"
    elif level.upper() == "info".upper():
        prompt: str = f"{Fore.BLUE}[INFO]{Style.RESET_ALL}"
    elif level.upper() == "success".upper():
        prompt: str = f"{Fore.GREEN}[+]{Style.RESET_ALL}"
    elif level.upper() == "failure".upper():
        prompt: str = f"{Fore.BLUE}[-]{Style.RESET_ALL}"

    result_msg: str = "{:>20}: {}".format(prompt, msg)
    print(result_msg)
    return result_msg


def do_read_dict(dict_path: str, holder: dict) -> None:
    debug_print("debug", f"{dict_path}")
    try:
        lines = []
        with open(dict_path, 'r', encoding='utf-8') as dict_file:
            lines = dict_file.readlines()
        lines = [ line.strip() for line in lines if line.find('\t') != -1 ]

        for line in lines:
            split_line = line.split('\t')
            character = split_line[0]
            code = split_line[1]
            weight = 1
            if len(split_line) >= 3:
                weight = int(split_line[2]) - 1000000
                if weight == 0:
                    weight = 1
                if weight >= 9999:
                    weight = 9999
            holder[f"{character}_{code}"] = weight
    except Exception as why:
        traceback.print_exc()

def do_output_result(output_path: str, holder: dict) -> None:
    debug_print("debug", f"{output_path}")
    if output_path == "__not_exist_path__":
        return
    with open(output_path, 'w', encoding='utf-8') as output_file:
        for char_code, weight in holder.items():
            char, code = char_code.split('_')
            output_file.write(f"{char}\t{code}\t{weight}\n")


def main():
    parser = argparse.ArgumentParser(description=f"此脚本可以将98至善")
    parser.add_argument('-id', '--input-dz',required=True , help="输入: 98码表-单字")
    parser.add_argument('-ic', '--input-ci', help="输入: 98码表-词")
    parser.add_argument('-od', '--output-dz',required=True, help="输出: 98码表-单字")
    parser.add_argument('-oc', '--output-ci', help="输出: 98码表-词")

    args = parser.parse_args()
    g_input_dz_path = args.input_dz
    g_output_dz_path = args.output_dz
    if args.input_ci is not None:
        global g_input_ci_path
        g_input_ci_path = args.input_ci
    if args.output_ci is not None:
        global g_output_ci_path
        g_output_ci_path = args.output_ci

    debug_print("info", g_input_dz_path)
    debug_print("info", g_input_ci_path)
    debug_print("info", g_output_dz_path)
    debug_print("info", g_output_ci_path)

    # 读取码表
    thread_dz = threading.Thread(target=do_read_dict, args=(g_input_dz_path, g_dz_holder))
    thread_ci = threading.Thread(target=do_read_dict, args=(g_input_ci_path, g_ci_holder))

    thread_dz.start()
    thread_ci.start()

    thread_dz.join()
    thread_ci.join()

    debug_print("info", "读入码表")

    print(len(g_ci_holder))
    l_ci_holder = { char_code: weight for char_code, weight in g_ci_holder.items() if char_code not in g_dz_holder}
    print(len(l_ci_holder))
    print(l_ci_holder)

    # 输出码表
    thread_dz = threading.Thread(target=do_output_result, args=(g_output_dz_path, g_dz_holder))
    thread_ci = threading.Thread(target=do_output_result, args=(g_output_ci_path, l_ci_holder))

    thread_dz.start()
    thread_ci.start()

    thread_dz.join()
    thread_ci.join()


if __name__ == "__main__":
    main()

